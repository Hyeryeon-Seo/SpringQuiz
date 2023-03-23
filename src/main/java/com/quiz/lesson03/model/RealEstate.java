package com.quiz.lesson03.model;

import java.util.Date;

public class RealEstate {
	private int id;
	private int realtorId;
	private String address;
	private int area;
	private String type; // 타입 char 주의! - t: String으로함
	private int price;
	private Integer rentPrice; // int면 안됨 null 허용가능! 없으면 null로 채워진 상태
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRealtorId() {
		return realtorId;
	}
	public void setRealtorId(int realtorId) {
		this.realtorId = realtorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Integer getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(Integer rentPrice) {
		this.rentPrice = rentPrice;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	
}
