<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="${board.name} 작성"/>
<%@ include file="../part/head.jspf"%>
        
        <div class="write-box con-min-width">
            <div class="con">
                <form class="form-box-type-2" action="doWrite" method="POST">
                    <div>
                        <div>
                            <span>제목 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="제목을 입력해 주세요." name="title"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <textarea maxlength="2000" placeholder="내용을 입력해 주세요." name="body"></textarea>
                        </div>
                    </div>
                    <div>
                        <div>
                            <input type="submit" value="작성"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>