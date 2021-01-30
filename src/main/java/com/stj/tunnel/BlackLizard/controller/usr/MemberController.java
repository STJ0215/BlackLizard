package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stj.tunnel.BlackLizard.dto.Member;
import com.stj.tunnel.BlackLizard.service.MemberService;
import com.stj.tunnel.BlackLizard.util.Util;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "/usr/member/join";
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(@RequestParam Map<String, Object> param) {
		String loginId = Util.getAsStr(param.get("loginId"), "");
		
		if (loginId.length() == 0) {
			return String.format("<sript> alert('로그인 아이디를 입력해 주세요.'); history.back(); </script>");
		}
		
		boolean isJoinAvailableLoginId = memberService.isJoinAvailableLoginId(loginId);
		
		if (isJoinAvailableLoginId == false) {
			return String.format("<script> alert('%s(은)는 이미 사용중인 아이디 입니다.'); history.back(); </script>", loginId);
		}
				
		int id = memberService.join(param);
		
		return String.format("<script> alert('%d번 회원이 생성되었습니다.'); location.replace('/usr/article/list'); </script>", id);
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "/usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw, HttpSession session) {
		
		if (loginId.length() == 0) {
			return String.format("<script> alert('로그인 아이디를 입력해 주세요.'); history.back(); </script>");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return String.format("<script> alert('%s은(는) 존재하지 않는 로그인 아이디 입니다.'); history.back(); </script>", loginId);
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return String.format("<script> alert('로그인 비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		}
		
		session.setAttribute("loginedMemberId", member.getId());
		
		return String.format("<script> alert('%s님 환영합니다.'); location.replace('/usr/article/list'); </script>", member.getName());
	}
}
