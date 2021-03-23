package com.stj.tunnel.BlackLizard.controller.usr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	@RequestMapping("/usr/home/main")
	public String showMain() {
		return "/usr/home/main";
	}
}
