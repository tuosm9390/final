package com.kh.hotels.mngMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngMember.model.vo.Member;

public interface MemberDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member loginMember(SqlSessionTemplate sqlSession, Member m);

}
