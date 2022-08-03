package com.payalot.enjoyforott.poster.model.vo;

import lombok.Getter;
import lombok.Setter;

public class PosterReview {

	
	@Getter
	@Setter
	private int postNo;
	private String postName;
	private int avgScore;
	private int watchedPeople;
	
	public PosterReview() {
		super();
	}

	public PosterReview(int postNo, String postName, int avgScore, int watchedPeople) {
		super();
		this.postNo = postNo;
		this.postName = postName;
		this.avgScore = avgScore;
		this.watchedPeople = watchedPeople;
	}

	@Override
	public String toString() {
		return "PosterReview [postNo=" + postNo + ", postName=" + postName + ", avgScore=" + avgScore
				+ ", watchedPeople=" + watchedPeople + "]";
	}

	
}
