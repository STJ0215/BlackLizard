<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="${board.name} 게시물 수정"/>
<%@ include file="../part/head.jspf"%>
        
        <div class="modify-box con-min-width">
            <div class="con">
                <form class="form-box-type-2" action="doModify" method="POST">
                    <input type="hidden" name="id" value="${article.id}"/>
                    <div>
                        <div>
                            <span>ID :</span>
                        </div>
                        <div>
                            <span>${article.id}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>등록일 :</span>
                        </div>
                        <div>
                            <span>${article.regDate}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>수정일 :</span>
                        </div>
                        <div>
                            <span>${article.updateDate}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>제목 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="제목을 입력해 주세요." 
                                    name="title" value="${article.title}"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>내용 :</span>
                        </div>
                        <div>
                            <textarea maxlength="2000" placeholder="내용을 입력해 주세요." name="body">${article.body}</textarea>
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <span>수정 :</span>
                        </div>
                        <div>
                            <input type="submit" value="수정"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <br>
        
        <div class="sub-menu-bar con-min-width">
            <div class="con">
                <a href="list">게시물 목록</a>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>