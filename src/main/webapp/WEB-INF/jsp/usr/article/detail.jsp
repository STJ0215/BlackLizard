<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 상세 정보</title>
	</head>
	
	<body>
		<h1>게시물 상세 정보</h1>
		
		<div>ID : ${article.id}</div>
		<div>등록일 : ${article.regDate}</div>
		<div>수정일 : ${article.updateDate}</div>
		<div>제목 : ${article.title}</div>
		<div>내용 : ${article.body}</div>
	</body>
</html>