package com.kh.hotels.mngMember.model.service;

import com.kh.hotels.mngMember.model.exception.LoginException;
import com.kh.hotels.mngMember.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int selectMemberId(String userId);

	int insertMember(Member m);

}
