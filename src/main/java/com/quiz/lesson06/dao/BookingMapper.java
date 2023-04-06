package com.quiz.lesson06.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingMapper {

	public List<Booking> selectBookingList(); 
	
	public int insertBooking(String name, Date date, int day, int headcount, String phoneNumber);

	public void deleteBookingById(int id);
	
	// 예약 조회 - 일단은 여러 정보 가져올 수 있도록 설정 (리턴: 리스트 List<Booking>) 
	public List<Booking> selectBookingByNamePhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
	
}
