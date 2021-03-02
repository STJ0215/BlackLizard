package com.stj.tunnel.BlackLizard.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.ReplyDao;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	public int writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}
}
