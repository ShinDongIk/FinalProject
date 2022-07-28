package com.payalot.enjoyforott.favor.model.vo;

import lombok.Getter;
import lombok.Setter;

public class Favor {
	
	@Setter
	@Getter
	private int favorNo;
	private int postNo;
	private String userId;
	private String postFavor;
	
	
	
	public Favor(int favorNo, int postNo, String userId, String postFavor) {
		super();
		this.favorNo = favorNo;
		this.postNo = postNo;
		this.userId = userId;
		this.postFavor = postFavor;
	}



	public Favor() {
		super();
	}



	@Override
	public String toString() {
		return "Favor [favorNo=" + favorNo + ", postNo=" + postNo + ", userId=" + userId + ", postFavor=" + postFavor
				+ "]";
	}
	
	
	
	

	

	
	
	
}
