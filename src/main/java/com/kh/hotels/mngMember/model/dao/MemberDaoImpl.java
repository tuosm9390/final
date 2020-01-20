package com.kh.hotels.mngMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.hotels.mngMember.model.vo.Member;

@Component
public class MemberDaoImpl implements MemberDao {

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectMemberPwd", m);
	}

	@Override
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.selectMember", m);
	}

}
