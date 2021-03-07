<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="댓글 수정"/>
<%@ include file="../part/head.jspf"%>
        
        <form action="doModify" method="POST">
            <input type="hidden" name="id" value="${reply.id}"/>
            <div>
                ID : ${reply.id}
            </div>
            <div>
                등록일 : ${reply.regDate}
            </div>
            <div>
                수정일 : ${reply.updateDate}
            </div>
            <div>
                내용 : <input type="text" maxlength="30" placeholder="내용을 입력해 주세요." 
                            name="body" value="${reply.body}"/>
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