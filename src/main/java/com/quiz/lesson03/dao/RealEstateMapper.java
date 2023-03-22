package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateMapper {

	// 1.
	public RealEstate selectRealEstateById(@Param("id") int id); // 한 개일때는 @Param생략 가능
	
	// 2.
	public List<RealEstate> selectRealEstateByRentPrice(@Param("rent_price") Integer rentPrice); 
	// @Param부분은 파라미터이름이고, 오른쪽은 DB테이블칼럼명인가?
	
	// 3.
	public List<RealEstate> selectRealEstateByAreaPrice(@Param("area") int area, @Param("price") int price);

}
