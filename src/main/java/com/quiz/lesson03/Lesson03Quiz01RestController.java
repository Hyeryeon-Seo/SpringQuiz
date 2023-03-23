package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")// 공통 주소
@RestController // responsebody 어노가 있기때문에 list는 json형식으로 응답
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=  
	@RequestMapping("/1")  // id 하나에 대한 한 데이터만 리턴이라서 - 리스트 X
	public RealEstate quiz01_1 (
			@RequestParam("id") int id // id 꼭들어오는 필수 파라미터로 지정 (이게젤 간단)
			) {
		return realEstateBO.getRealEstateById(id); // 받는 id에 해당하는 bo.. 리턴
	}
	
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=(90)
	// 2번 문제는 파라미터당 답 여러개 가능해서 list로 , 필수인 파라미터 받기
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2 (
			@RequestParam("rent_price") int rentPrice // t- value=""는 쓸수도 / int로 함 
			// - 파라미터 필수로 null아니게 받을거라서? : "사실은 Integer가 더 정확하다"고 하심 (null가능하므로) 벗 파라미터로 받는건 null아닌걸로 할거라서..
			// 실제로 model패키지에서 변수는 rentPrice -Integer로 잡았지만 파라미터 int로 잡아도 잘 실행됨
			) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice); // lesson02떄처럼 list이름붙여서 굳이 만들어주지않아도 걍 return해주면됨 +근데 이거 2번문제와 리스트 이름 같게 해도 되긴 함
	}
	
	// http://localhost:8080/lesson03/quiz01/3?area= &price=
	// 3번 문제도 파라미터당 답 여러개 가능해서 list로 , + 복수개! 필수인 파라미터 받기
	// * Mybatis는 파라미터를 단 한개만 보낼 수 있다
	// * 파라미터가 2개 이상일 때는 하나의 맵으로 만들어서 보내야 한다.
	// @ Param을 사용하면 하나의 맵으로 만들어준다.
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3 (
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price
			) {
		// List<RealEstate> realEstateAPList = realEstateBO.getRealEstateListByAreaPrice(area, price);
		// return realEstateAPList;   --- 앞 2번에서 말했듯이 바로 리턴해주면 됨
		return realEstateBO.getRealEstateListByAreaPrice(area, price);
	}
	
}
