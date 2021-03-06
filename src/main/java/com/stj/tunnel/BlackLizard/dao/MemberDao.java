package com.stj.tunnel.BlackLizard.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.stj.tunnel.BlackLizard.dto.Member;

@Mapper
public interface MemberDao {
	void join(Map<String, Object> param);
	
	Member getMemberById(@Param("id") int id);
	
	Member getMemberByLoginId(@Param("loginId") String loginId);
	
	void modify(Map<String, Object> param);
}
