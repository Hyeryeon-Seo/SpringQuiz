package com.quiz.lesson01;

public class Board {
	// 필드
	private String title;
	private String user;
	private String content;

	// 메소드 - getter, setter 
	// (이해하고) 이는 따로 직접 안만들어도, 오른쪽마우스 -source- Generate Getters and Setters (fields in ..선택 하고) 로 만들면 됨
	public String getTitle() {
		return this.title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getUser() {
		return this.user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
}
