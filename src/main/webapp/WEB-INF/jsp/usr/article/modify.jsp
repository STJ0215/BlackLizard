<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="${board.name} 게시물 수정"/>
<%@ include file="../part/head.jspf"%>
        
        <form action="doModify" method="POST">
            <input type="hidden" name="id" value="${article.id}"/>
            <div>
                ID : ${article.id}
            </div>
            <div>
                등록일 : ${article.regDate}
            </div>
            <div>
                수정일 : ${article.updateDate}
            </div>
            <div>
                제목 : <input type="text" maxlength="30" placeholder="제목을 입력해 주세요." name="title"
                value="${article.title}"/>
            </div>
            <div>
                내용 : <input type="text" maxlength="30" placeholder="내용을 입력해 주세요." name="body"
                value="${article.body}"/>
            </div>
            <div>
                수정 : <input type="submit" value="수정"/>
            </div>
        </form>
        <br>
        <div>
            <a href="../article/list">게시물 목록</a>
        </div>
<%@ include file="../part/foot.jspf"%>