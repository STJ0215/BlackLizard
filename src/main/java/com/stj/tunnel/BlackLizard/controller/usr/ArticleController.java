package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stj.tunnel.BlackLizard.dto.Article;

@Controller
public class ArticleController {
	@RequestMapping("/usr/article/list")
	public String showList(Model model) {
		List<Article> articles = new ArrayList<>();
		
		Article article1 = new Article(1, "2021-01-23 20:00:00", "2021-01-23 20:00:00", "제목1", "내용1");
		Article article2 = new Article(2, "2021-01-23 21:00:00", "2021-01-23 21:00:00", "제목2", "내용2");
		Article article3 = new Article(3, "2021-01-23 22:00:00", "2021-01-23 22:00:00", "제목3", "내용3");
		
		articles.add(article1);
		articles.add(article2);
		articles.add(article3);
		
		model.addAttribute("articles", articles);
		
		return "usr/article/list";
	}
}
