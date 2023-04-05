package com.quiz.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/weather")
@Controller
public class WeatherHistoryController {

	@Autowired
	private WeatherHistoryBO weatherHistoryBO;

	@GetMapping("/weather_history_view") // 주소는 단어별 그대로 붙이지말고 하이픈-이나 _로 연결해서 쓰기
	public String weahterHistoryView(Model model) { // 별도의 input은 필요없음 (그냥 주소치면 뜨게할것) / model에 담기
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList); // 여기에 바로 bo호출도 가능하나, 윗줄있어야 bo받아온거 리스트 잘 저장했는지 디버깅 수월
		return "weather/weatherHistory";
	}
	
	@GetMapping("/add_weather_view")
	public String addWeahterView() {
		return "weather/addWeather";
	}
	
	@PostMapping("/add_weather") //insert 들어오는 요청 -postMapping - 이건 post로만 들어올수
	public String addWeather( // 결국 view페이지 리턴할거니 string
			// 아래처럼 하나씩 파라미터 받아올수도 있고 model로 받아올 수 
			@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed) {
		
		// insert
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		// 여기서는 insert - select - model 로 안하고 이 과정말고, insert-redirect로 (이미 model.. 받아서 weather_history_view목록페이지있으므로)
		
		// redirect : 목록 페이지로 
		return "redirect:/weather/weather_history_view";
	}
	
	
	
	
}
