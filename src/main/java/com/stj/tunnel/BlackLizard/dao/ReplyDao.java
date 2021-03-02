package com.stj.tunnel.BlackLizard.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDao {
	void writeReply(Map<String, Object> param);
}
