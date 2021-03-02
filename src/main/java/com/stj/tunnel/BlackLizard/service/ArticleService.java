package com.stj.tunnel.BlackLizard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.ArticleDao;
import com.stj.tunnel.BlackLizard.dto.Article;
import com.stj.tunnel.BlackLizard.util.Util;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	public List<Article> getForPrintArticles(Map<String, Object> param) {
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
		
		return articleDao.getForPrintArticles(param);
	}
	
	public int getTotalCount(Map<String, Object> param) {
		return articleDao.getTotalCount(param);
	}

	public Article getForPrintArticleById(int id) {
		return articleDao.getForPrintArticleById(id);
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
