package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz02")
@RestController
public class Lesson03Quiz02RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	
	// http://localhost:8080/lesson03/quiz02/1
	@RequestMapping("/1")
	public String quiz02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(1000000);
		
		int rowCount = realEstateBO.addRealEstate(realEstate); // insert해달라 요청하면 입력성공 개수 돌려받음
		
		return "입력 성공 : " + rowCount;
	}

	
	// 파라미터 하나씩 쪼개서 넘기기 / 근데 realtor_id 파라미터 주소창에서 입력 받기 (메소드 파라미터 받는 ()괄호 안에 넣기
	// 파라미터이름은 @RequestParam뒤에 붙는"realtor_id" 이며 db칼럼은 (int) realtorId 다름에 주의!)
	// http://localhost:8080/lesson03/quiz02/2?realtor_id=
	@RequestMapping("/2")
	public String quiz02_2(@RequestParam("realtor_id") int realtorId) {
		
		int rowCount = realEstateBO.addRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + rowCount;
		// return realEstateBO.getRealEstateListByRealtorId(realtorId);
	
	}
	
	
	
}
