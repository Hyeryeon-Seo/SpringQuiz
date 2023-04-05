package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteMapper;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteMapper favoriteMapper;
	
	// select  - input: x , output: List<Favorite>
	public List<Favorite> getFavoriteList() {
		// List<Favorite> favoriteList = favoriteMapper.selectFavoriteList();
		return favoriteMapper.selectFavoriteList(); // 그냥 바로 리턴하면 됨
	}
	
	// add  , void말고 int해줄수도 (int 성공한행개수)
	public int addFavorite(String name, String url) {
		return favoriteMapper.insertFavorite(name, url);
	}
	
	// 주소 중복 체크
	// input:url  output:boolean
	public boolean existFavoriteByUrl(String url) {
		return favoriteMapper.existFavoriteByUrl(url);
	}
	
	
	
	
	
}
