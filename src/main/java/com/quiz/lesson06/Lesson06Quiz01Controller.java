package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	FavoriteBO favoriteBO;
	
	
	// 즐겨찾기 추가 페이지(lesson06/addFavorite.jsp)로 이동 (Get매핑)
	// http://localhost:8080/lesson06/quiz01/add_favorite_view
	@GetMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	
	
	// AJAX를 통한 요청 - 즐겨찾기 추가
	// 위 주소 통해 들어간 addFavorite.jsp에서-  AJAX 통신으로 받아서 즐겨찾기 추가하기 
	
	// AJAX를 통한 요청 - 원래는 반드시 String으로 내리기 + ResponseBody붙이기...인데
	// 이제부턴 실제API팀처럼 String이 아닌 Map으로 내릴 것.   - JSON으로 최종 결과내리기  
	@PostMapping("add_favorite")
	@ResponseBody
	public Map<String, Object> addFavorite( // map으로 리턴해준다
			// addFavorite.jsp에서 (AJAX를 통해) 받는 파라미터 
			@RequestParam("title") String name, // 뒤의 변수명(name)짓는거는 서버 마음대로가능.. 앞의파라미터는 jsp에서받은대로
			@RequestParam("url") String url) {
		// json {"code": 1, "result":"성공"}
		//      {"code": 500, "errorMessage":"추가하는데 실패했습니다."}
		
		
		// insert - favoriteBO만들어서 addFavorite 메소드생성해 불러오기
		// rowCount : 성공된 행의 갯수
		int rowCount = favoriteBO.addFavorite(name, url); // 즐찾 추가한 결과는 성공된행의갯수로 리턴받고
		
		Map<String, Object> result = new HashMap<>(); // result라는 Map을 만들어서
		if (rowCount > 0) {  // 받은 성공된 행의 갯수가 1이상이라면 - 성공된 것이니
			result.put("code", 1); // result맵에 code(key)에 1 (value)
			result.put("result", "성공"); // result맵에 result라는 키에, 성공이라는 value
		} else { // 그게 아니면 성공된행갯수 x니 에러이므로
			result.put("code", 500); // 500 등과같이 부여해줄 수 
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
		
		return result; 
		// map인데.. - JSON String 으로 응답 내려감 
		// (-> 다시 addFavorite.jsp의 AJAX의 response로 내려가면, 해당 'result'라는 json string을
		// ?? 이해 잘 안됨 ㅠ
		
	}

	
	
	// 결과 목록 페이지
	// http://localhost:8080/lesson06/quiz01/favorite_list_view
	@GetMapping("/favorite_list_view") 
	public String favoriteListView(Model model) {
		/* s틀린경우:  Favorite favorites = new Favorite();
		   			model.addAttribute("favorites", favorites);
		 >> 이런 식으로 하면 (lesson05 ex03처럼 Date 특수한? 객체면 몰라도..)
		    그냥 model안 favorite 클래스로 어쩌란 거 ㅠㅠ  db 전체 select해서 리스트 가져와 담든지해야지
		 	이전lesson봐도, model.add.. 담기 전에 꼭 객체부른걸로 bo의 메소드등 부른다는 걸 기억하자
		 	lesson05 예제 ex02 참고! */
	
		List<Favorite> favoriteList = favoriteBO.getFavoriteList(); // select,가져온 즐찾목록들을 list객체에 담아주고
		model.addAttribute("favoriteList", favoriteList); // model에도 담고
		
		return "lesson06/favoriteList";
	}
	
	
	// 주소 중복 체크
	// AJAX의 요청
	@ResponseBody
	@GetMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) { // addFavorite.jsp에서 ajax방식으로 요청된- 주소(입력된) 넘겨받아서
		
		Map<String, Boolean> result = new HashMap<>(); // result 맵 생성
		result.put("isDuplication", favoriteBO.existFavoriteByUrl(url)); // 이 맵에 
		return result;
	} 
	
	
	
	
	

}
