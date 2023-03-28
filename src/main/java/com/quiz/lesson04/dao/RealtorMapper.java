package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Realtor;

@Repository
public interface RealtorMapper {

	// 공인중개사 정보 추가하기
	public void insertRealtor(Realtor realtor);
	
	// insert한 정보 (새롭게 추가한 내용 id 가져와서) 가져오기
	public Realtor selectRealtorById(int id);
	
}
