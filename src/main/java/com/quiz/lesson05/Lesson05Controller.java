package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.model.Member;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Controller {

	@GetMapping("/quiz01")
	public String quiz01() {
		return "lesson05/quiz01";
		
	}
	
	
	// 주소 치고 들어오는 경우는 다 GetMapping
	@GetMapping("/quiz02")
	public String quiz02(Model model) { // 데이터를 view페이지로 내려야 하기 때문에, model 필요
		// quiz02_1
		List<String> musicRanking = new ArrayList<>();
		musicRanking.add("강남스타일");
		musicRanking.add("벚꽃엔딩");
		musicRanking.add("좋은날");
		musicRanking.add("거짓말");
		musicRanking.add("보고싶다");
		model.addAttribute("musicRanking", musicRanking); // model에 꼭 넣어주고 -> jsp에서 model key로 해당 list 꺼내기
		
		
		// quiz02_2
		List<Map<String, Object>> membership = new ArrayList<>();

		Map<String, Object> member = new HashMap<>();
		member.put("name", "손오공");
		member.put("phoneNumber", "010-1234-5678");
		member.put("grade", "VIP");
		member.put("point", 12040);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "저팔계");
		member.put("phoneNumber", "010-4321-1234");
		member.put("grade", "BASIC");
		member.put("point", 3420);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "사오정");
		member.put("phoneNumber", "010-8888-1111");
		member.put("grade", "GOLD");
		member.put("point", 1530);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "삼장");
		member.put("phoneNumber", "010-0000-1234");
		member.put("grade", "GOLD");
		member.put("point", 8450);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "우마왕");
		member.put("phoneNumber", "010-1111-2222");
		member.put("grade", "BASIC");
		member.put("point", 420);
		membership.add(member);
		
		model.addAttribute("membership", membership); 
		// 여기서 model addAttribute의 value값, member라고 두면 하나의 member 맵만 내려가므로 x, 주의 / membership(list명)이라고해야 여러 맵(member정보) 담긴 list내려감 
		// 이후 jsp에서 c:forEach 태그로 해당 list 안의 map 반복시키며 (var="member"넣고) - 해당 map의 key값으로 value값 출력할 것 (${member.name}이런 식)
		
		return "lesson05/quiz02";
		
	}
	
	@GetMapping("/quiz03")
	public String quiz03(Model model) {
		// 1
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		model.addAttribute("candidates", candidates);
		
		// 2
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		
		model.addAttribute("cardBills", cardBills); // cardBills s붙이기! : 하나의맵아닌, 리스트 내려줄 것이므로
		
		return "lesson05/quiz03";
	}
	
	
	// 주의! - 이번엔 list안의 map 아니고, list안에 Member객체! 
	@GetMapping("/quiz04")
	public String quiz04(Model model) {// Model 에 list 담아서 활용
		List<Member> members = new ArrayList<>();

		Member member = new Member(); // Member 객체 필요하니 model패키지에 만들어야
		member.setName("유비");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("youbee@gmail.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("저는 촉의 군주 유비입니다. 삼국통일을 위해 열심히 일하겠습니다.");
		members.add(member);

		member = new Member();
		member.setName("관우");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("woo@naver.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("관우에요. 저는 유비형님 보다 나이는 많지만 일단 아우입니다.");
		members.add(member);

		member = new Member();
		member.setName("장비");
		member.setPhoneNumber("02-111-3333");
		member.setNationality("삼국시대 촉한");
		member.setEmail("tools@gmail.com");
		member.setIntroduce("장비라우");
		members.add(member);

		member = new Member();
		member.setName("조조");
		member.setPhoneNumber("010-0987-4321");
		member.setNationality("삼국시대 위");
		member.setEmail("jojo@gmail.com");
		member.setIntroduce("이름은 조조 자는 맹덕이라 하오");
		members.add(member);

		member = new Member();
		member.setName("주유");
		member.setPhoneNumber("010-0000-1111");
		member.setNationality("삼국시대 오");
		member.setEmail("jooyou@kakao.com");
		member.setIntroduce("주유는 주유소에서 ㅋㅋ");
		members.add(member);

		member = new Member();
		member.setName("황충");
		member.setPhoneNumber("031-432-0000");
		member.setNationality("삼국시대 촉한");
		member.setEmail("yellowbug@naver.com");
		member.setIntroduce("내 수염 좀 멋있는 듯");
		members.add(member);
		
		model.addAttribute("members", members); // member말고 members 리스트 담아야
		
		return "lesson05/quiz04";
	}
	
	
	
}
