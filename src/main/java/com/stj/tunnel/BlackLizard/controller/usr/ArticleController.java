package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stj.tunnel.BlackLizard.dto.Article;
import com.stj.tunnel.BlackLizard.service.ArticleService;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/usr/article/list")
	public String showList(Model model) {
		List<Article> articles = articleService.getArticles();
		
		
		model.addAttribute("articles", articles);
		
		return "usr/article/list";
	}
}
