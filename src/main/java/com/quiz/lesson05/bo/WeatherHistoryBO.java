package com.quiz.lesson05.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherHistoryMapper;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryMapper weatherHistoryMapper;

	
	// input:X (그냥 주소입력하면 뜨게함)     output: List<WeatherHistory> _ 행 여러개니 리스트 , 하나하나의행이 WeatherHistory
	public List<WeatherHistory> getWeatherHistoryList() {
		return weatherHistoryMapper.selectWeatherHistoryList(); // return되는 이 selectList(전체다select한)의 결과가 List<>에 담김
	}
	
	public void addWeatherHistory(
			Date date, String weather, double temperatures,
			double precipitation, String microDust, double windSpeed) {
		
		weatherHistoryMapper.insertWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
	}
}
