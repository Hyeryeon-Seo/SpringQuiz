package com.quiz.lesson05.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface WeatherHistoryMapper {

	public List<WeatherHistory> selectWeatherHistoryList(); // bo의 get..List로 전달
	
	public void insertWeatherHistory(
			@Param("date") Date date, 
			@Param("weather") String weather, 
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation, 
			@Param("microDust") String microDust, 
			@Param("windSpeed") double windSpeed);
}
