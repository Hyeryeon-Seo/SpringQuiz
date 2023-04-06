package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	
	// 1. 예약 목록 페이지
	// http://localhost:8080/booking/booking_list_view
	@GetMapping("/booking_list_view")
	public String BookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList); 
		return "booking/bookingList";
	}
	
	// 1번 문제 예약 삭제 - AJAX의 호출
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking (
			@RequestParam("id") int id) {
		
		// delete
		bookingBO.deleteBookingById(id);
		
		Map<String, Object> result = new HashMap<>();
		// 에러가 안났다면 성공이라고 보고
			result.put("code", 1); // result맵에 code(key)에 1 (value)
			result.put("result", "성공");
			return result; 
	}	
	
	// 2. 예약하기 페이지 화면
	// http://localhost:8080/booking/make_booking_view
	@GetMapping("/make_booking_view")
	public String makeBookingView() {
		return "booking/makeBooking";
	}
	
	
	// 2 - 예약하기 기능 처리: AJAX를 통한 요청 - 예약 목록 추가
	@PostMapping("/make_booking")
	@ResponseBody
	public Map<String, Object> makeBooking(
			//model attribute로 받을 수도 있다
			
		// 사실 makeBooking.jsp에서 받는 내용이 string인가, 해서 int등의경우변환해서 넣어야 하는지 의문..
		@RequestParam("name") String name,
		@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
		// 이부분이 좀 어려운데 다르게하니까
		// String으로 받아와도 되고, 혹은 위의 DateTimeFormat으로 아예 date로 변환해서 받아와도 됨
		@RequestParam("day") int day,   // 받을 때 Date(string으로 받는거?), int 등 파라미터 타입 맞을까?
		@RequestParam("headcount") int headcount,
		@RequestParam("phoneNumber") String phoneNumber) {
		
		// insert
		// rowCount: 성공된 행 갯수
		// int rowCount안써도됨
		int rowCount = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
				
		Map<String, Object> result = new HashMap<>(); // 여기에 포인트걸고 디버깅
		if (rowCount > 0) {  // 받은 성공된 행의 갯수가 1이상이라면 - 성공된 것이니
			result.put("code", 1); // result맵에 code(key)에 1 (value)
			result.put("result", "성공"); // result맵에 result라는 키에, 성공이라는 value
		} else { // 그게 아니면 성공된행갯수 x니 에러이므로
			result.put("code", 500); // 500 등과같이 부여해줄 수 
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
		return result; 
	}
	
	// 3. 예약 조회 페이지
	// http://localhost:8080/booking/search_booking_view
	// 주소치고들어가도 상관없으므로 (그냥 조회기능) get방식
	@GetMapping("/search_booking_view")
	public String searchBookingView() {
		return "booking/searchBooking";
	}
	
	// 3 예약 조회 - AJAX 요청
	@ResponseBody //404에러_ 주의: 없으면 잭슨라이브러리가동작안해서 (result을 화면으로인식) 뷰의경로?못찾아
	@GetMapping("/search_booking")
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Object> result = new HashMap<>();

		// 아직 구현안했는데 할 게 있을때 TODO  라고써준다 (옆라인에도 적힘)
		// select
		// list아님 한 개만 가져오기
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);
		if (booking != null) {
			result.put("code", 1);
			// 부킹 자체를 통으로 내려도 됨
			result.put("booking", booking);
		} else {
			result.put("code", 500);
		}
		return result;
	}
	
}
