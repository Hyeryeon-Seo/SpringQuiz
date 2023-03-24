package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerMapper;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {

	@Autowired
	SellerMapper sellerMapper;
	
	public void addSeller(String nickname, String profileImage, double temperature) {
		sellerMapper.insertSeller(nickname, profileImage, temperature);
	}
	
	// 2. 최신 seller 정보 가져와 출력
	public Seller getLatestSeller() { // import해야
		return sellerMapper.selectLatestSeller();
	}
	
	// 3. id파라미터 받아서 해당 seller 출력
	public Seller getSellerById(Integer id) {
		return sellerMapper.selectSellerById(id);
	}
	
	
	
}
