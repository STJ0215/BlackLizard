<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="회원정보 수정"/>
<%@ include file="../part/head.jspf"%>
        
        <div class="modify-member-box con-min-width">
            <div class="con">
                <form class="form-box-type-2" action="doModify" method="POST">
                    <input type="hidden" name="checkLoginPwAuthCode" value="${param.checkLoginPwAuthCode}"/>
                    <div>
                        <div>
                            <span>회원번호 :</span>
                        </div>
                        <div>
                            <span>${loginedMember.id}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>가입일 :</span>
                        </div>
                        <div>
                            <span>${loginedMember.regDate}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>로그인 아이디 :</span>
                        </div>
                        <div>
                            <span>${loginedMember.loginId}</span>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>이름 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="이름을 입력해 주세요." 
                            name="name" value="${loginedMember.name}"/>
                        </div>
                    </div>
                    <div>
                        <div>
                        	
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
                <a onclick="history.back();">뒤로가기</a>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>