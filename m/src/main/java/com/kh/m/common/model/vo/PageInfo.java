package com.kh.m.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@AllArgsConstructor //모든 필드를 매개변수로 갖는 생성자
@Setter //setter
@Getter //getter
@ToString //toString
@EqualsAndHashCode //equals,hashcode 
@Data //위에 있는 모든 메소드를 포함하는 어노테이션

public class PageInfo {

	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

}
