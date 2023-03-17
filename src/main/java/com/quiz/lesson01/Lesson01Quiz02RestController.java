package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController // @Controller + @ResponseBody
public class Lesson01Quiz02RestController {
	// @ResponseBody + return String => HttpMessageConverter(스프링프레임워크안의 이게 동작해서): String -> response에 글자로 담긴다. 내용 타입은 text/html 
	// @ResponseBody + return 객체 => HttpMessageConverter : jackson 라이브러리 동작시킴 -> JSON String이 응답에 담김 - 타입 application/json
	
	
	// 1. List 와 그 안의 Map , json형태로 출력
	// http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		List<Map<String, Object>> movieInfoList = new ArrayList<>(); //T는 이름 result

		Map<String, Object> movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("title", "기생충");
		movieInfoList.add(movie);
		
		movie = new HashMap<>();
		// Map<String, Object> movie2 = new HashMap<>();  --movie5까지..
		// 일일히 나는 이렇게 했지만,
		// 2번째 방법 - 맵 재활용하기
		// 실제로 답을 보니 일일히 movie1, movie2 안 만들어도
		// Map 한번 만들어서 movie, 에 put하고 list에 put한 후
		// 다시 재 설정(새로운 맵이 되는것), movie = new HashMap<>() (Map방식 새로 써줄거 없이) 해 준후 또 put 하고 list에 add 반복하면 됨
		movie.put("rate", 0);
		movie.put("director", "로베르토 베니니");
		movie.put("time", 116);
		movie.put("title", "인생은 아름다워");
		movieInfoList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 12);
		movie.put("director", "크리스토퍼 놀란");
		movie.put("time", 147);
		movie.put("title", "인셉션");
		movieInfoList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 19);
		movie.put("director", "윤종빈");
		movie.put("time", 133);
		movie.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		movieInfoList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "프란시스 로렌스");
		movie.put("time", 137);
		movie.put("title", "헝거게임");
		movieInfoList.add(movie);
		
		return movieInfoList;
	}
	
	
	// 2. 게시판 내용의 json을 List 와 Class 설계 활용해 출력
	// http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/2")
	public List<Board> quiz02_2() { // list안에 Data 클래스
		List<Board> boardList = new ArrayList<>(); // T- result 이름
		
		Board board = new Board(); // 자바 빈 생성
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		boardList.add(board);

		board = new Board();
		board.setTitle("헐 대박");
		board.setUser("bada");
		board.setContent("오늘 목요일이 었어... 금요일인줄");
		boardList.add(board);
		
		board = new Board();
		board.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		board.setUser("dulumary");
		board.setContent("...");
		boardList.add(board);
		
		return boardList; // List -> JSON String 
	}
	
	
	// 3. ResponseEntity
	// http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_3() { // list안에 Data 클래스
		// List<Board> boardList = new ArrayList<>();  - t: list안만듦 (굳이 안만들어도, 그냥 한 board만 넘기면되니)
		Board board = new Board(); // 자바 빈 생성 -
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		// boardList.add(board);
	
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
