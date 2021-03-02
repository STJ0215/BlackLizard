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
        
        <h2>댓글 작성</h2>
        
        <form action="/usr/reply/doWrite" method="POST">
            <input type="hidden" name="relTypeCode" value="article">
            <input type="hidden" name="relId" value="${param.id}">
            <div>
                <textarea rows="5" name="body" placeholder="댓글을 입력해주세요."></textarea>
            </div>
            <input type="submit" value="작성">
        </form>
<%@ include file="../part/foot.jspf"%>