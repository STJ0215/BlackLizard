package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stj.tunnel.BlackLizard.service.ReplyService;
import com.stj.tunnel.BlackLizard.util.Util;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/usr/reply/doWrite")
	public String doWrite(HttpServletRequest req, Model model, @RequestParam Map<String, Object> param) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		param.put("memberId", loginedMemberId); // 작성자 아이디
		
		int id = replyService.writeReply(param); // 댓글 번호
		String relTypeCode = (String)param.get("relTypeCode");
		int relId = Util.getAsInt(param.get("relId"));
				
		model.addAttribute("msg", String.format("%d번 댓글이 생성되었습니다.", id));
		model.addAttribute("redirectUri", String.format("/usr/%s/detail?id=%d", relTypeCode, relId));
		
		return "/common/redirect";
	}

}
