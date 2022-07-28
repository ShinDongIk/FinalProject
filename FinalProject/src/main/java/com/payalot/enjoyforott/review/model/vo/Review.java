package com.payalot.enjoyforott.review.model.vo;

import java.sql.Date;

public class Review {

	private int postNo;
	private String userId;
	private String postReview;
	private Date createDate;
	private String reviewStatus;
	
	public Review() {
		super();
	}

	public Review(int postNo, String userId, String postReview, Date createDate, String reviewStatus) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.postReview = postReview;
		this.createDate = createDate;
		this.reviewStatus = reviewStatus;
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

	public String getPostReview() {
		return postReview;
	}

	public void setPostReview(String postReview) {
		this.postReview = postReview;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "Review [postNo=" + postNo + ", userId=" + userId + ", postReview=" + postReview + ", createDate="
				+ createDate + ", reviewStatus=" + reviewStatus + "]";
	}
	
	
	
	
}
