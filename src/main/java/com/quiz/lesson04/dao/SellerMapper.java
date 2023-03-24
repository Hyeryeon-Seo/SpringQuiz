package com.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerMapper {

	public void insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImage") String profileImage,
			@Param("temperature") Double temperature
			);
	
	// 2. id(파라미터)없을때 최신 seller정보 출력
	public Seller selectLatestSeller();

	// 3. id파라미터 받아서 해당 seller정보만 출력
	public Seller selectSellerById(@Param("id") Integer id);
	
}
