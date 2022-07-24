package com.kh.m.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // �⺻ ������
@AllArgsConstructor //��� �ʵ带 �Ű������� ���� ������
@Setter //setter
@Getter //getter
@ToString //toString
@EqualsAndHashCode //equals,hashcode 
@Data //���� �ִ� ��� �޼ҵ带 �����ϴ� ������̼�

public class PageInfo {

	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

}
