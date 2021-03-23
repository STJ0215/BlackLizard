package com.stj.tunnel.BlackLizard.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.MemberDao;
import com.stj.tunnel.BlackLizard.dto.Member;
import com.stj.tunnel.BlackLizard.dto.ResultData;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private AttrService attrService;
	
	@Value("${custom.siteName}")
	private String siteName;
	@Value("${custom.siteUri}")
	private String siteUri;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteLoginUri}")
	private String siteLoginUri;
	
	public int join(Map<String, Object> param) {
		memberDao.join(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		String authCode = genEmailAuthCode(id);
		
		sendJoinCompleteMail(id, (String)param.get("email"), authCode);
		
		return id;
	}
	
	private String genEmailAuthCode(int actorId) {
		String authCode = UUID.randomUUID().toString();
		//attrService.setValue("member__" + actorId + "__extra__emailAuthCode", authCode, Util.getDateStrLater(60 * 60));
		// 유효기간 삭제 (임시)
		attrService.setValue("member__" + actorId + "__extra__emailAuthCode", authCode);

		return authCode;
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
	
	private void sendJoinCompleteMail(int actorId, String email, String authCode) {
		String mailTitle = String.format("[%s] 가입이 완료되었습니다. 이메일 인증을 완료해 주세요.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>가입이 완료되었습니다.</h1>");
		mailBodySb.append("<div>아래 링크를 클릭하여 이메일 인증을 완료 해주세요.</div>");
		
		String doAuthEmailUri = siteUri + "/usr/member/doAuthEmail?authCode=" + authCode + "&email=" + email + "&actorId=" + actorId;
		mailBodySb.append(String.format("<p><a href=\"%s\" target=\"_blank\">인증하기</a></p>", doAuthEmailUri));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}
	
	public String getEmailAuthCode(int actorId) {
		return attrService.getValue("member__" + actorId + "__extra__emailAuthCode");
	}
	
	public void saveAuthedEmail(int actorId, String email) {
		attrService.setValue("member__" + actorId + "__extra__authedEmail", email);
	}
	
	public String getAuthedEmail(int actorId) {
		return attrService.getValue("member__" + actorId + "__extra__authedEmail");
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
	
	public ResultData setTempPasswordAndNotify(Member member) {
		Random r = new Random();
		
		// 10000 ~ 99999
		String tempLoginPw = (10000 + r.nextInt(90000)) + "";
		
		String mailTitle = String.format("[%s] 임시 패스워드가 발급되었습니다", siteName);
		String mailBody = "";
		mailBody += String.format("로그인 아이디 : %s", member.getLoginId());
		mailBody += "<br>";
		mailBody += String.format("임시 패스워드 : %s", tempLoginPw);
		mailBody += "<br>";
		mailBody += String.format("<a href=\"%s\" target==\"_blank\">로그인 하러가기</a>", siteLoginUri);
		
		ResultData sendResultData = mailService.send(member.getEmail(), mailTitle, mailBody);
		
		if (sendResultData.isFail()) {
			return new ResultData("F-1", "메일 발송에 실패했습니다.");
		}
		
		Map<String, Object> modifyParam = new HashMap<>();
		
		modifyParam.put("id", member.getId());
		modifyParam.put("loginPw", Util.sha256(tempLoginPw));
		
		memberDao.modify(modifyParam);
		
		return new ResultData("S-1", "임시 패스워드를 이메일로 발송했습니다.");
	}
	
	public void modify(Map<String, Object> param) {
		memberDao.modify(param);
	}

	public String genCheckLoginPwAuthCode(int actorId) {
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + actorId + "__extra__modifyPrivateAuthCode", authCode, Util.getDateStrLater(60 * 60));

		return authCode;
	}
	
	public ResultData checkValidCheckLoginPwAuthCode(int actorId, String checkLoginPwAuthCode) {
		if (attrService.getValue("member__" + actorId + "__extra__modifyPrivateAuthCode").equals(checkLoginPwAuthCode)) {
			return new ResultData("S-1", "유효한 키 입니다.");
		}

		return new ResultData("F-1", "유효하지 않은 키 입니다.");
	}
}
