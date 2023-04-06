package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingMapper;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingMapper bookingMapper;
	
	// input: x   output:List<Booking>  (예약목록 전체 select)
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	
	// add  , void말고 int해줄수도 (int 성공한행개수)
	public int addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		return bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	// delete 만들기 (deleteBookingById) _ input:id  output:X
	public void deleteBookingById(int id) {
		bookingMapper.deleteBookingById(id);
	}
	
	// 예약 조회 - 조회된정보중 최신 정보로 가져오기 (여러개나타나도 1개만)
	// 일단 mapper에서는 list로 받아오고 여기서 1개로 바꾸기
	// input:name, phoneNumber   output:Booking
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
		// 제일 최신내용은 이 리스트의 마지막에 있다 _but 0개라면(리스트가 비어있다면) : [] 이렇게 됨
		// 복수개:[1, 3, 7]  혹은 [] 혹은 [7]   이런식으로 담김
		if (bookingList.isEmpty()) {
			return null; // 없으면 null로 리턴
		}
		// 비어있지않으면 값이 있고, 마지막 인덱스에 있는 값을 돌려준다 (최신값)
		return bookingList.get(bookingList.size() - 1); // 마지막 index(인덱스는 0부터)넣기 (즉 담긴 개수 -1 해주면 됨)
	}
	
	
}
