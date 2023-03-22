package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")// 공통 주소
@RestController
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
	
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=
	// 2번 문제는 파라미터당 답 여러개 가능해서 list로 , 필수인 파라미터 받기
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2 (
			@RequestParam("rent_price") Integer rentPrice
			) {
		List<RealEstate> realEstateRPList = realEstateBO.getRealEstateByRentPrice(rentPrice);
		return realEstateRPList; 
	}
	
	// @RequestParam(value="id") int id 
	// http://localhost:8080/lesson03/quiz01/2?rent_price=
	// 3번 문제도 파라미터당 답 여러개 가능해서 list로 , + 복수개! 필수인 파라미터 받기
	// + 근데 이거 2번문제와 리스트 이름 같게 해도 되긴 함
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3 (
			@RequestParam("area") int area,
			@RequestParam("price") int price
			) {
		List<RealEstate> realEstateAPList = realEstateBO.getRealEstateByAreaPrice(area, price);
		return realEstateAPList; 
	}
	
}
