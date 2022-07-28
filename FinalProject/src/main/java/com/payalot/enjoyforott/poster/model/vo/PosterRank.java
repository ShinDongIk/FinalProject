package com.payalot.enjoyforott.poster.model.vo;

import org.springframework.stereotype.Service;

@Service
public class PosterRank {

	private String postName;
	private String PostImg;
	
	
	

	public PosterRank() {
		super();
	}



	public PosterRank(String postName, String postImg) {
		super();
		this.postName = postName;
		PostImg = postImg;
	}




	public String getPostName() {
		return postName;
	}



	public void setPostName(String postName) {
		this.postName = postName;
	}



	public String getPostImg() {
		return PostImg;
	}



	public void setPostImg(String postImg) {
		PostImg = postImg;
	}



	@Override
	public String toString() {
		return "PosterRank [postName=" + postName + ", PostImg=" + PostImg + "]";
	}






}
