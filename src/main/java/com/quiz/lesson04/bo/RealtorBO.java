package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.RealtorMapper;
import com.quiz.lesson04.model.Realtor;

@Service
public class RealtorBO {

	@Autowired
	private RealtorMapper realtorMapper;
	
	// add,insert 공인중개사 정보 추가하기
	public void addRealtor(Realtor realtor) {
		realtorMapper.insertRealtor(realtor); 
	}
	
	// get,select 추가한 공인중개사 정보 가져오기 (mapper.xml에서 useGeneratedKeys 를 이용,insert한 내용 id얻어내서 활용)
	// 이 경우 정보 return 해야하므로 void 아니고 Realtor 객체
	public Realtor getRealtorById(int id) {
		return realtorMapper.selectRealtorById(id);
	}
	
	
}
