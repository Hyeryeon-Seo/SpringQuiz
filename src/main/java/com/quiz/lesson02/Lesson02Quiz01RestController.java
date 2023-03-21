package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController
public class Lesson02Quiz01RestController {

	@Autowired // BO도 스프링빈이니 Autowired injection
	private StoreBO storeBO;
	
	// http://localhost:8080/lesson02/quiz01
	@RequestMapping("/lesson02/quiz01") // 주소
	public List<Store> quiz01() { // 메소드 만들기
		List<Store> storeList = storeBO.getStoreList(); // BO안의 메소드를 불러서 리턴
		return storeList;
	}
	
	
	
}
