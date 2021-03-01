<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="게시물 상세 정보"/>
<%@ include file="../part/head.jspf"%>
        
        <div>ID : ${article.id}</div>
        <div>등록일 : ${article.regDate}</div>
        <div>수정일 : ${article.updateDate}</div>
        <div>작성자 : ${article.extra.writer}</div>
        <div>제목 : ${article.title}</div>
        <div>내용 : ${article.body}</div>
        <br>
        <div>
            <a href="list">게시물 목록</a>
            <a href="modify?id=${article.id}">수정</a>
            <a href="doDelete?id=${article.id}" onclick="if (confirm('삭제하시겠습니까?') == false) return false;">삭제</a>
        </div>
<%@ include file="../part/foot.jspf"%>