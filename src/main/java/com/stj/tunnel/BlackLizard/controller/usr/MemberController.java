package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String doJoin(Model model, @RequestParam Map<String, Object> param) {
		String loginId = Util.getAsStr(param.get("loginId"), "");
		
		if (loginId.length() == 0) {
			model.addAttribute("msg", "로그인 아이디를 입력해주세요.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		boolean isJoinAvailableLoginId = memberService.isJoinAvailableLoginId(loginId);
		
		if (isJoinAvailableLoginId == false) {
			model.addAttribute("msg", String.format("%s(은)는 이미 사용중인 로그인 아이디입니다.", loginId));
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
				
		int id = memberService.join(param);
		
		model.addAttribute("msg", "회원 가입이 완료되었습니다");
		model.addAttribute("redirectUri", "/usr/article/list");
		
		return "/common/redirect";
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "/usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	public String doLogin(HttpSession session, Model model, String loginId, String loginPw) {
		
		if (loginId.length() == 0) {
			model.addAttribute("msg", "로그인 아이디를 입력해주세요.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			model.addAttribute("msg", String.format("%s(은)는 존재하지 않는 로그인 아이디입니다.", loginId));
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("msg", "로그인 비밀번호가 일치하지 않습니다.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		session.setAttribute("loginedMemberId", member.getId());
		
		model.addAttribute("msg", String.format("%s님 환영합니다.", member.getName()));
		model.addAttribute("redirectUri", "/usr/article/list");
		
		return "/common/redirect";
	}
	
	@RequestMapping("/usr/member/doLogout")
	public String doLogout(HttpSession session, Model model) {
		int loginedMemberId = 0;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int)session.getAttribute("loginedMemberId");
		}
		
		if (loginedMemberId == 0) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("redirectUri", "/usr/member/login");
			
			return "/common/redirect";
		}
		
		session.removeAttribute("loginedMemberId");
		
		model.addAttribute("redirectUri", "/usr/article/list");
		
		return "/common/redirect";
	}
}