package com.stj.tunnel.blacklizard.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.stj.tunnel.blacklizard.dto.Member;

@Mapper
public interface MemberDao {
	void join(Map<String, Object> param);
	
	Member getMemberById(@Param("id") int id);
	
	Member getMemberByLoginId(@Param("loginId") String loginId);
	
	Member getMemberByNameAndEmail(String name, String email);
	
	void modify(Map<String, Object> param);
}
