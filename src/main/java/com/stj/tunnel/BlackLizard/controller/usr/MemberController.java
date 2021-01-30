package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
