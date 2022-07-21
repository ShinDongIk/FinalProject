package com.payalot.enjoyforott.favor.model.vo;

public class Favor {

	private int postNo;
	private String userId;
	private String postFavor;
	
	public Favor() {
		super();
	}

	public Favor(int postNo, String userId, String postFavor) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.postFavor = postFavor;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostFavor() {
		return postFavor;
	}

	public void setPostFavor(String postFavor) {
		this.postFavor = postFavor;
	}

	@Override
	public String toString() {
		return "Favor [postNo=" + postNo + ", userId=" + userId + ", postFavor=" + postFavor + "]";
	}
	
	
	
}
