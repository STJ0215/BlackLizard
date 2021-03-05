package com.stj.tunnel.BlackLizard.controller.usr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stj.tunnel.BlackLizard.dto.Article;
import com.stj.tunnel.BlackLizard.dto.Reply;
import com.stj.tunnel.BlackLizard.service.ArticleService;
import com.stj.tunnel.BlackLizard.service.ReplyService;
import com.stj.tunnel.BlackLizard.util.Util;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/usr/article/list")
	public String showList(Model model, @RequestParam Map<String, Object> param) {
		List<Article> articles = articleService.getForPrintArticles(param);
		
		int totalCount = articleService.getTotalCount(param);
		int itemsCountInAPage = 10;
		int totalPage = (int)Math.ceil(totalCount / (double)itemsCountInAPage);
		int pageMenuArmSize = 5;
		int page = Util.getAsInt(param.get("page"), 1);
		
		int pageMenuStart = page - pageMenuArmSize;
		if (pageMenuStart < 1) {
			pageMenuStart = 1;
		}
		
		int pageMenuEnd = page + pageMenuArmSize;
		if (pageMenuEnd > totalPage) {
			pageMenuEnd = totalPage;
		}
		
		param.put("itemsCountInAPage", itemsCountInAPage);
		
		model.addAttribute("articles", articles);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		model.addAttribute("pageMenuArmSize", pageMenuArmSize);
		model.addAttribute("pageMenuStart", pageMenuStart);
		model.addAttribute("pageMenuEnd", pageMenuEnd);
		
		return "/usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	public String showDetail(Model model, int id, String listUrl) {
		Article article = articleService.getForPrintArticleById(id);
		List<Reply> replies = replyService.getForPrintReplies("article", id);
		
		if (listUrl == null) {
			listUrl = "/usr/article/list";
		}
		
		model.addAttribute("article", article);
		model.addAttribute("replies", replies);
		
		model.addAttribute("listUrl", listUrl);
						
		return "/usr/article/detail";
	}
	
	@RequestMapping("/usr/article/write")
	public String showWrite(HttpServletRequest req, Model model) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		return "/usr/article/write";
	}
	
	@RequestMapping("/usr/article/doWrite")
	public String doWrite(HttpServletRequest req, Model model, @RequestParam Map<String, Object> param) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		param.put("memberId", loginedMemberId); // 작성자 아이디
		
		int id = articleService.writeArticle(param); // 게시물 번호
		
		model.addAttribute("msg", String.format("%d번 게시물이 생성되었습니다.", id));
		model.addAttribute("redirectUri", String.format("/usr/article/detail?id=%d", id));
		
		return "/common/redirect";
	}
	
	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		Article article = articleService.getForPrintArticleById(id);
		
		if (article.getMemberId() != loginedMemberId) {
			model.addAttribute("msg", "수정 권한이 없습니다.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		model.addAttribute("article", article);
		
		return "/usr/article/modify";
	}
	
	@RequestMapping("/usr/article/doModify")
	public String doModify(HttpServletRequest req, Model model, int id, String title, String body) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		Article article = articleService.getForPrintArticleById(id);
		
		if (article.getMemberId() != loginedMemberId) {
			model.addAttribute("msg", "수정 권한이 없습니다.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
				
		articleService.modifyArticle(id, title, body);
		
		model.addAttribute("msg", String.format("%d번 게시물이 수정되었습니다.", id));
		model.addAttribute("redirectUri", String.format("/usr/article/detail?id=%d", id));
		
		return "/common/redirect";
	}
	
	@RequestMapping("/usr/article/doDelete")
	public String doDelete(HttpServletRequest req, Model model, int id) {
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		Article article = articleService.getForPrintArticleById(id);
		
		if (article.getMemberId() != loginedMemberId) {
			model.addAttribute("msg", "삭제 권한이 없습니다.");
			model.addAttribute("historyBack", true);
			
			return "/common/redirect";
		}
		
		articleService.deleteArticleById(id);
		
		model.addAttribute("msg", String.format("%d번 게시물이 삭제되었습니다.", id));
		model.addAttribute("redirectUri", "/usr/article/list");
		
		return "/common/redirect";
	}
}
