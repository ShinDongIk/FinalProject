package com.payalot.enjoyforott.poster.model.vo;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 모든 필드를 매개변수로 갖는 생성자
@Setter
@Getter
@ToString
@EqualsAndHashCode // equals, hashcode
public class Poster {

	private int postNo;
	private String postName;
	private String postDes;
	private String postKind;
	private String postOtt;
	private Date LoadDate;
	private String PostStatus;
	private String PostImg;
	
	public Poster(String postName, String postDes, String postKind, String postOtt, String postImg) {
		super();
		this.postName = postName;
		this.postDes = postDes;
		this.postKind = postKind;
		this.postOtt = postOtt;
		PostImg = postImg;
	}
	
	
}
