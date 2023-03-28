package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

// 참고로 맵핑주소는 한 프로젝트내에서 중복되면 안됨
@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	SellerBO sellerBO;
	
	// 1. 판매자 정보 추가 페이지 (추가페이지 jsp로 넘기기)
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	// 이경우 get method - @GetMapping("/add_seller_view") 쓸 수 있음
	@RequestMapping(path="/add_seller_view", method=RequestMethod.GET) 
	public String addSellerView() {
		//   /WEB-INF/jsp/lesson04/addSeller.jsp
		return "/lesson04/addSeller";
	}
	
	// 1번 > 추가페이지에서 입력받은 정보,파라미터 - DB에 Insert하고 > 결과페이지(afterAddSeller.jsp)로 넘기기 ("입력 성공")
	// http://localhost:8080/lesson04/quiz01/add_seller
	@PostMapping("/add_seller") // addSeller.jsp 에서 post방식(의 action에 쓴 주소)으로 받음
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImage", required=false) String profileImage,
			@RequestParam(value="temperature", required=false) double temperature) { // null이 될 수 있다고 보고, Double로 쓰기 (double말고)
		
		// insert DB
		sellerBO.addSeller(nickname, profileImage, temperature);
		
		// 결과 jsp view
		return "lesson04/afterAddSeller";
	}
	
	// 2. 최신 판매자 정보 출력페이지
	// http://localhost:8080/lesson04/quiz01/seller_info (id 파라미터 입력안되었을때는 최신판매자정보로)
	// 3. seller 검색 출력 (id를 parameter로 받아 해당 seller 출력) - 2번과 같은 메소드(get..) 활용
	// http://localhost:8080/lesson04/quiz01/seller_info?id=
	@GetMapping("/seller_info") // get방식으로 RequestMapping해서 "/seller_info"주소 입력 시 seller_info.jsp로 이동(리턴)
	public String getSeller(Model model,
			@RequestParam(value="id", required=false) Integer id) { // t- 여기서 integer로 하심
			// id파라미터는 비필수, id없을 시 받아온(import) model(데이터가져와야할시사용)로 seller받아서
		// +근데 혹시 id int를 Integer로 해야하나? > 그렇게바꾸니(model/Seller상 변수타입까지 바꾸진않았으나) 뜸
		
		// 3. 파라미터id 해당 seller정보만 출력 (이므로 List는 아님)
		// 원래 if문은 bo에서 하는 게 좋음
		// if문 밖에 seller 정의
		Seller seller = null;
		if(id != null) { // t 는 ==null조건 먼저 씀
			seller = sellerBO.getSellerById(id);
		} else { // 2. 최신판매자정보- BO의 latestSeller메소드 실행
			seller = sellerBO.getLatestSeller();
		}
		
		model.addAttribute("seller", seller); // 얜 if문 밖에 빼면 됨
		// 정보페이지 출력
		return "lesson04/seller_info"; // seller_info.jsp
		
	}
		
	
	
	
	
		
}
