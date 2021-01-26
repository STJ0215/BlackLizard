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
	
	public List<Article> getArticles() {		
		return articleDao.getArticles();
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
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
