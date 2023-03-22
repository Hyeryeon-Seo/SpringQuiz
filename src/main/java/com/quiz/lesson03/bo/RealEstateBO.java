package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateMapper;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateMapper realEstateMapper;
	
	// 1번
	// input: id   output: RealEstate (컨트롤러에게 돌려줌)
	public RealEstate getRealEstateById(int id) {  // 메소드명, where절 들어가면 by붙여서 칼럼명 명시해서 보통 씀
		return realEstateMapper.selectRealEstateById(id);
	}
	
	// 2번
	// input: rentPrice  output: RealEstate (RP)리스트
	public List<RealEstate> getRealEstateByRentPrice(Integer rentPrice) {
		List<RealEstate> realEstateRPList = realEstateMapper.selectRealEstateByRentPrice(rentPrice);
		return realEstateRPList;
	}

	// 3번
	// input: area, price    output: RealEstate 리스트
	public List<RealEstate> getRealEstateByAreaPrice(int area, int price) {
		List<RealEstate> realEstateAPList = realEstateMapper.selectRealEstateByAreaPrice(area, price);
		return realEstateAPList;
	}
}
