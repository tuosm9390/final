package com.kh.hotels.mngMember.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngMember.model.dao.MemberDao;
import com.kh.hotels.mngMember.model.exception.LoginException;
import com.kh.hotels.mngMember.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberDao md;
	
	@Override
	public Member loginMember(Member m) throws LoginException {

		Member loginMember;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPassword)){

			loginMember = md.loginMember(sqlSession, m);
			
		}else {
			
			throw new LoginException("로그인 실패!");
		}
		
		return loginMember;
	}
	
	

}
