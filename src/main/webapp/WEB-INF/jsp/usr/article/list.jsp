<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 목록</title>
	</head>

	<body>
		<h1>게시물 목록</h1>
		
		<div>총 게시물 갯수 : ${totalCount}</div>
		<div>
			<a href="write">게시물 작성</a>
		</div>
		<hr>
	
		<c:forEach var="article" items="${articles}">
			ID : <a href="detail?id=${article.id}">${article.id}</a> <br>
			작성일 : ${article.regDate} <br>
			수정일 : ${article.updateDate} <br>
			제목 : <a href="detail?id=${article.id}">${article.title}</a> <br>
			<br>
			작업 : <a href="modify?id=${article.id}">수정</a>
					<a href="doDelete?id=${article.id}" onclick="if (confirm('게시물을 삭제하시겠습니까?') == false) return false;">삭제</a>
			<hr>
		</c:forEach>
		
		<div>
			<a href="write">게시물 작성</a>
		</div>
		<br>
		
		<span>페이지</span>
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="?page=${i}">${i}</a>
		</c:forEach>
	</body>
</html>