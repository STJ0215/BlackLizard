package com.stj.tunnel.BlackLizard.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.MemberDao;
import com.stj.tunnel.BlackLizard.dto.Member;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MailService mailService;
	
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;
	
	public int join(Map<String, Object> param) {
		memberDao.join(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		sendJoinCompleteMail((String)param.get("email"));
		
		return id;
	}
	
	public boolean isJoinAvailableLoginId(String loginId) {
		Member member = memberDao.getMemberByLoginId(loginId);
		
		if (member == null) {
			return true;
		}
		
		return false;
	}
	
	public boolean isJoinAvailableNameAndEmail(String name, String email) {
		if (name == null || name.length() == 0) {
			return false;
		}
		if (email == null || email.length() == 0) {
			return false;
		}
		
		Member member = memberDao.getMemberByNameAndEmail(name, email);
		
		return member == null;
	}
	
	private void sendJoinCompleteMail(String email) {
		String mailTitle = String.format("[%s] 가입이 완료되었습니다.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>가입이 완료되었습니다.</h1>");
		mailBodySb.append(String.format("<p><a href=\"%s\" target=\"_blank\">%s</a>로 이동</p>", siteMainUri, siteName));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}
	
	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}
	
	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}
	
	public Member getMemberByNameAndEmail(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}
	
	public void modify(Map<String, Object> param) {
		memberDao.modify(param);
	}
}
