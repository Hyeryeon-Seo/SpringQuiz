package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreMapper;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {

	@Autowired  // BO는 (dao의) Mapper (-@repository)를 불러서 달라고 해야함 
	private StoreMapper storeMapper; // 여기서 부르고 
	
	public List<Store> getStoreList() {
		List<Store> storeList = storeMapper.selectStoreList(); // 부른 dao의 mapper의, 메소드(select) 부르기
		return storeList;
	}
	
}
