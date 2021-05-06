package com.stj.tunnel.blacklizard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.blacklizard.dao.ArticleDao;
import com.stj.tunnel.blacklizard.dto.Article;
import com.stj.tunnel.blacklizard.dto.Board;
import com.stj.tunnel.blacklizard.dto.Member;
import com.stj.tunnel.blacklizard.util.Util;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	public Board getBoardByCode(String boardCode) {
		return articleDao.getBoardByCode(boardCode);
	}
	
	public List<Article> getForPrintArticles(Member actorMember, Map<String, Object> param) {
		int page = Util.getAsInt(param.get("page"), 1);
		
		if (page < 1) {
			page = 1;
		}
		
		int itemsCountInAPage = Util.getAsInt(param.get("itemsCountInAPage"), 10);
		
		// 안전장치 - itemsCountInAPage 가 너무 많거나 적을 때를 방지
		if (itemsCountInAPage > 100) {
			itemsCountInAPage = 100;
		}
		else if (itemsCountInAPage < 1) {
			itemsCountInAPage = 1;
		}
		
		// page가 1이고, itemsCountInAPage가 10일 때, 확인 가능한 게시물 => 1 ~ 10번 (최근)
		int limitFrom = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
		
		param.put("limitFrom", limitFrom);
		param.put("limitTake", limitTake);
		
		List<Article> articles = articleDao.getForPrintArticles(param);
		
		for (Article article : articles) {
			if (article.getExtra() == null) {
				article.setExtra(new HashMap<>()); 
			}
			
			boolean actorCanModify = false;
			
			if (actorMember != null) {
				actorCanModify = actorMember.getId() == article.getMemberId();
			}
			
			boolean actorCanDelete = false;
			
			if (actorMember != null) {
				actorCanDelete = actorMember.getId() == article.getMemberId();
			}

			article.getExtra().put("actorCanModify", actorCanModify);
			article.getExtra().put("actorCanDelete", actorCanDelete);
		}

		return articles;
	}
	
	public int getTotalCount(Map<String, Object> param) {
		return articleDao.getTotalCount(param);
	}

	public Article getForPrintArticleById(Member actorMember, int id) {
		Article article = articleDao.getForPrintArticleById(id);
		
		if (article.getExtra() == null) {
			article.setExtra(new HashMap<>());
		}
		
		boolean actorCanModify = false;
		
		if (actorMember != null) {
			actorCanModify = actorMember.getId() == article.getMemberId();
		}
		
		boolean actorCanDelete = false;
		
		if (actorMember != null) {
			actorCanDelete = actorMember.getId() == article.getMemberId();
		}
		
		article.getExtra().put("actorCanModify", actorCanModify);
		article.getExtra().put("actorCanDelete", actorCanDelete);
		
		return article;
	}
	
	public int writeArticle(Map<String, Object> param) {
		articleDao.writeArticle(param);
		
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}

	public void modifyArticle(int id, String title, String body) {
		articleDao.modifyArticle(id, title, body);
	}
	
	public void deleteArticleById(int id) {
		articleDao.deleteArticleById(id);		
	}
}
