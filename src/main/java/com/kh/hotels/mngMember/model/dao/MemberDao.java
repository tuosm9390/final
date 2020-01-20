package com.kh.hotels.mngMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngMember.model.vo.Member;

public interface MemberDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member loginMember(SqlSessionTemplate sqlSession, Member m);

	int selectMemberId(SqlSessionTemplate sqlSession, String userId);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int selectMno(SqlSessionTemplate sqlSession, Member m);

	int insertStaff(SqlSessionTemplate sqlSession, Member m);

}
