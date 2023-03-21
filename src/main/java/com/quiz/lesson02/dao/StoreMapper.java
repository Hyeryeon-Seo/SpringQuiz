package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository // db와 가장 가까운
// 이 dao의 StoreMapper (인터페이스) 만들고 - resources/mappers/안의 ..Mapper.xml과 연결해야
public interface StoreMapper {

	public List<Store> selectStoreList(); 

}
