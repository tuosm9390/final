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

	@Override
	public int selectMemberId(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("Member.selectMemberId", userId);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public int selectMno(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectMno", m);
	}

	@Override
	public int insertStaff(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertStaff", m);
	}

	@Override
	public int updateMemberPwd(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("Member.updateMemberPwd", m);
	}

	@Override
	public int checkHotelSetting(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Member.checkHotelSetting");
	}

}
