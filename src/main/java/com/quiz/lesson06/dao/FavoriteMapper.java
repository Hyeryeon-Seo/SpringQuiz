package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteMapper {
	
	// select
	public List<Favorite> selectFavoriteList();
	
	// add - insert
	public int insertFavorite(
			@Param("name") String name,
			@Param("url") String url);

	// 주소 중복 체크1 - 0: 거짓(중복x) , 그외: 참
	public boolean existFavoriteByUrl(String url);
	
	// 주소 중복 체크2 (select방식)
	public Favorite selectFavoriteByUrl(String url); 
	
	// delete id로
	public int deleteFavoriteById(int id);
	

}
