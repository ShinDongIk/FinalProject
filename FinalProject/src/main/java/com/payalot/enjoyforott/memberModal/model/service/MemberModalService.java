package com.payalot.enjoyforott.memberModal.model.service;

import com.payalot.enjoyforott.memberModal.model.vo.MemberModal;

public interface MemberModalService {
	
	//상대 회원 정보 불러오는 메소드
	public abstract MemberModal selectMember(String clickNickName);
	
	//신고 등록하는 메소드
	public abstract int insertDeclar(MemberModal mm);
}
