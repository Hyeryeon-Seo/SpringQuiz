package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateMapper {

	// quiz01_1.
	public RealEstate selectRealEstateById(@Param("id") int id); // 한 개일때는 @Param생략 가능
	
	// 2.
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice); // 1번처럼 쓸 수도 있지만- 파라미터 하나일 때는 @Param 안쓰는게 낫다
	// @Param부분은 파라미터이름이고, 오른쪽은 DB테이블칼럼명인가?
	
	// 3.
	public List<RealEstate> selectRealEstateListByAreaPrice(@Param("area") int area, @Param("price") int price);

	// quiz02_1
	public int insertRealEstate(RealEstate realEstate);  // 앞의 int는 돌려줄 타입
	
	// quiz02_2 : insert (별개 field, realtor_id 파라미터 받아서)
	public int insertRealEstateAsField(
			// ** 여기서 에러 났었음 주의!!! - dao의 Mapper인페에서는, insert메소드안에 
			// 받는 파라미터 @Param을 입력해주는데, 파라미터이름 꼭 Mapper.xml에서도 #{}안에 맞춰줘야 함!!
			// (@Param 말고 뒤 변수명은 아무렇게 지어도 됨_다른 레이어랑 순서만 맞춘다면 - 여기레이어에서만 통함)
			@Param("realtor_id") int realtorId1, // 앞의 @Param이름과 .xml에서 맞춰줘야!!
			@Param("address7") String address3,  // address7로 이름설정하고 .xml에서도 #{}에서 맞춰주었더니 됨
			@Param("area") int area4,
			@Param("type") String type5,
			@Param("price") int pri3ce,
			@Param("rentPrice") Integer rentPrice2);
	
	
	// quiz03 - UPDATE
	public int updateRealEstateById(
			// + 단어 더블클릭하면 복사됨
			@Param("id") int id,
			@Param("type") String type,
			@Param("price") int price);
	

	// quiz04 -delete
	public int deleteRealEstateById(@Param("id") int id); // @Param생략가능
	
}
