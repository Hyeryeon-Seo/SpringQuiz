package com.quiz.lesson03.bo;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateMapper;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateMapper realEstateMapper;
	
	// quiz01 1번
	// input: id   output: RealEstate (컨트롤러에게 돌려줌)
	public RealEstate getRealEstateById(int id) {  // 메소드명, where절 들어가면 by붙여서 칼럼명 명시해서 보통 씀
		return realEstateMapper.selectRealEstateById(id);
	}
	
	// 2번
	// input: rentPrice  output: List<RealEstate> - (RP)리스트로 돌려줌
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) { // 메소드 명 중 List도 명시
		return realEstateMapper.selectRealEstateListByRentPrice(rentPrice);
	}

	// 3번
	// input: area, price    output: RealEstate 리스트
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price) { //메소드명중 AreaAndPrice할수도 있고 그냥 AreaPrice
		//List<RealEstate> realEstateAPList = realEstateMapper.selectRealEstateListByAreaPrice(area, price);
		// return realEstateAPList;
		return realEstateMapper.selectRealEstateListByAreaPrice(area, price);
	}
	
	// quiz02_1
	// input : RealEstate    output: 성공한 행 개수 int
	public int addRealEstate(RealEstate realEstate) { // ( ) 안에는 input, 받아오는 객체
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	
	// quiz02_2
	// add(추가)
	public int addRealEstateAsField(  
			// 한번 @Param("type") 이런식으로도 써줌 ㅠㅠ 위에보니 안써도 되는거같고 걍 realtorId 에서만 @Param도 붙여봤는데 상관없는듯
			// 변수명 여기 레이어에서만 통하므로 아무렇게 써보자
			int realtorId2,
			String address6, int area3, String type2, 
			int pr4ice, int rent1Price) {
		
		return realEstateMapper.insertRealEstateAsField(realtorId2, address6, area3, type2, pr4ice, rent1Price);
	}
	
	// quiz02_2 중 realtorId 파라미터 받기 (get-)
	//public int getRealEstateListByRealtorId(int realtorId) {
	//	return realEstateMapper.selectRealEstateByRealtorId(realtorId);
	// }

	
	
}
