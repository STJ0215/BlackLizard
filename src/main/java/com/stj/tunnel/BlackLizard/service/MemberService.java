package com.stj.tunnel.BlackLizard.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.MemberDao;
import com.stj.tunnel.BlackLizard.dto.Member;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public int join(Map<String, Object> param) {
		memberDao.join(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}
	
	public boolean isJoinAvailableLoginId(String loginId) {
		Member member = memberDao.getMemberByLoginId(loginId);
		
		if (member == null) {
			return true;
		}
		
		return false;
	}
	
	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}
	
	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}
	
	public void modify(Map<String, Object> param) {
		memberDao.modify(param);
	}
}
