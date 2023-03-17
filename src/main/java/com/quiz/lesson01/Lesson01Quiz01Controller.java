package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller
public class Lesson01Quiz01Controller {

	@RequestMapping("/1")
	@ResponseBody
	public String quiz01_1() {
		String text = "<h2>테스트 프로젝트 완성</h2> <b>해당 프로젝트를 통해서 문제 풀이를 진행합니다.</b>";
		return(text);
	}
	
	@RequestMapping("/2")
	public @ResponseBody Map<String, Object> quiz01_2() {
		Map<String, Object> map = new HashMap<>(); // 값은 Integer해도 됨
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		
		return(map); // 최종적으로는 json String으로 내려가 (json은 String이라는 것 기억!)
	}
	
	
}
