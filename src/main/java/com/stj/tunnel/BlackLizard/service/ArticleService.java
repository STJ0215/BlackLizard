package com.stj.tunnel.BlackLizard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stj.tunnel.BlackLizard.dao.ArticleDao;
import com.stj.tunnel.BlackLizard.dto.Article;

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
}
