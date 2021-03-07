package com.stj.tunnel.BlackLizard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.ReplyDao;
import com.stj.tunnel.BlackLizard.dto.Reply;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	public List<Reply> getForPrintReplies(String relTypeCode, int relId) {
		return replyDao.getForPrintReplies(relTypeCode, relId);
	}

	public Reply getForPrintReplyById(int id) {
		return replyDao.getForPrintReplyById(id);
	}
	
	public int writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}
	
	public void deleteReplyById(int id) {
		replyDao.deleteReplyById(id);
	}
}
