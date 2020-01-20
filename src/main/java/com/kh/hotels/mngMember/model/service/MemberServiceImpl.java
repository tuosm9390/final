package com.kh.hotels.mngMember.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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


	@Override
	public int selectMemberId(String userId) {
		
		return md.selectMemberId(sqlSession, userId);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE)
	public int insertMember(Member m) {
		
		String encPassword = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPassword);
		
		int result = 0;
		int result1 = md.insertMember(sqlSession, m);
		int mno = md.selectMno(sqlSession, m);
		m.setMno(mno);
		int result2 = md.insertStaff(sqlSession, m);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE)
	public int updateMemberPwd(Member m) {
		
		String encPassword = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPassword);
		
		return md.updateMemberPwd(sqlSession, m);
	}
	
	

}
