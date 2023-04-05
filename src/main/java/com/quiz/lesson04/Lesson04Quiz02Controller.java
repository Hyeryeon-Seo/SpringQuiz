package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	RealtorBO realtorBO;
	
	// 새 공인중개사 추가 페이지로 이동
	// http://localhost:8080/lesson04/quiz02/add_realtor_view (입력 form URL)
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// http://localhost:8080/lesson04/quiz02/add_realtor (입력 action URL)
	@PostMapping("/add_realtor")
	public String addRealtor(
			// 객체 받아오기 - 없으니 새로 model패키지 안에 만들기
			@ModelAttribute Realtor realtor, // realtor라는 ModelAttribute통해 한번에 받아옴 
			Model model) {
			
		// DB insert
		realtorBO.addRealtor(realtor);
		
		// DB select - id로 / 추가한 공인중개사 정보 가져오기 
		// 새로운 객체 만들기 (덮어써도 되나)
		Realtor latestRealtor = realtorBO.getRealtorById(realtor.getId()); // Realtor 클래스의 getter
		
		// Model에 데이터 담기
		model.addAttribute("realtor", latestRealtor);
		model.addAttribute("title", "공인중개사 정보");
		
		// 결과 view 이동- 추가된 공인중개사 정보 보여주는 jsp
		return "lesson04/afterAddRealtor";
		
	}
	
	
	
	
}
