package com.stj.tunnel.BlackLizard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.stj.tunnel.BlackLizard.dto.Reply;

@Mapper
public interface ReplyDao {

	List<Reply> getForPrintReplies(@Param("relTypeCode") String relTypeCode, @Param("relId") int relId);

	Reply getForPrintReplyById(@Param("id") int id);
	
	void writeReply(Map<String, Object> param);
	
	void modifyReply(Map<String, Object> param);
	
	void deleteReplyById(@Param("id") int id);
}
