package com.stj.tunnel.BlackLizard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.ReplyDao;
import com.stj.tunnel.BlackLizard.dto.Member;
import com.stj.tunnel.BlackLizard.dto.Reply;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	public List<Reply> getForPrintReplies(Member actorMember, String relTypeCode, int relId) {
		List<Reply> replies = replyDao.getForPrintReplies(relTypeCode, relId);
		
		for (Reply reply : replies) {
			if (reply.getExtra() == null) {
				reply.setExtra(new HashMap<>());
			}
			
			boolean actorCanModify = false;
			
			if (actorMember != null) {
				actorCanModify = actorMember.getId() == reply.getMemberId();
			}
			
			boolean actorCanDelete = false;
			
			if (actorMember != null) {
				actorCanDelete = actorMember.getId() == reply.getMemberId();
			}

			reply.getExtra().put("actorCanModify", actorCanModify);
			reply.getExtra().put("actorCanDelete", actorCanDelete);
		}
		
		return replies;
	}

	public Reply getForPrintReplyById(Member actorMember, int id) {
Reply reply = replyDao.getForPrintReplyById(id);
		
		if (reply == null) {
			return null;
		}
		
		if (reply.getExtra() == null) {
			reply.setExtra(new HashMap<>());
		}
		
		boolean actorCanModify = false;
		
		if (actorMember != null) {
			actorCanModify = actorMember.getId() == reply.getMemberId();
		}
		
		boolean actorCanDelete = false;
		
		if (actorMember != null) {
			actorCanDelete = actorMember.getId() == reply.getMemberId();
		}

		reply.getExtra().put("actorCanModify", actorCanModify);
		reply.getExtra().put("actorCanDelete", actorCanDelete);
		
		return reply;
	}
	
	public int writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}
	
	public void modifyReply(Map<String, Object> param) {
		replyDao.modifyReply(param);
	}
	
	public void deleteReplyById(int id) {
		replyDao.deleteReplyById(id);
	}
}
