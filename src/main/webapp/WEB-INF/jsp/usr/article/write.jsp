<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="게시물 작성"/>
<%@ include file="../part/head.jspf"%>
        
        <form action="doWrite" method="POST">
            <div>
                제목 : <input type="text" maxlength="30" placeholder="제목을 입력해 주세요." name="title"/>
            </div>
            <div>
                내용 : <input type="text" maxlength="30" placeholder="내용을 입력해 주세요." name="body"/>
            </div>
            <div>
                작성 : <input type="submit" value="작성"/>
            </div>
        </form>
        <br>
        <div>
            <a href="list">게시물 목록</a>
        </div>
<%@ include file="../part/foot.jspf"%>