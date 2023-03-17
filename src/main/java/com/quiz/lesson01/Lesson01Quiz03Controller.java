package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // spring bean
public class Lesson01Quiz03Controller {

	// http://localhost:8080/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1") // 연결 주소 (는 /1)
	public String quiz03() {
		// 아래 return 에는 application.proper-에 써진 prefix, suffix(.jsp) 제외 경로 쓰기 
		// 원래는 WEB-INF/jsp/    lesson01/quiz03    .jsp
		return "lesson01/quiz03";  // jsp view 경로 
	}
}
