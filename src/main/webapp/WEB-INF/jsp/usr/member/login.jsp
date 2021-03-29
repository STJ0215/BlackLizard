<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="회원 로그인"/>
<%@ include file="../part/head.jspf"%>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
        
        <script>
            var loginFormSubmitDone = false;
            
            function loginFormSubmit(form) {
                if (loginFormSubmitDone) {
                    alert('처리중입니다.');
                    
                    return;
                }
                
                form.loginId.value = form.loginId.value.trim();                
                if (form.loginId.value.length == 0) {
                    alert('로그인 아이디를 입력해 주세요.');
                    form.loginId.focus();

                    return;
                }

                form.loginPw.value = form.loginPw.value.trim();
                if (form.loginPw.value.length == 0) {
                    alert('로그인 패스워드를 입력해 주세요.');
                    form.loginPw.focus();

                    return;
                }

                form.loginPw.value = sha256(form.loginPw.value);

                form.submit();
                loginFormSubmitDone = true;
            }
        </script>
        
        <div class="login-box con-min-width">
            <div class="con">
                <form class="form-box-type-1" action="doLogin" method="POST" onsubmit="loginFormSubmit(this); return false;">
                    <div>
                        <div>
                            <span>아이디 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="로그인 아이디를 입력해 주세요." name="loginId"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>패스워드 :</span>
                        </div>
                        <div>
                            <input type="password" maxlength="30" placeholder="로그인 패스워드를 입력해 주세요." name="loginPw"/>
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <span>로그인 :</span>
                        </div>
                        <div>
                            <input type="submit" value="로그인"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="sub-menu-bar con-min-width">
            <div class="con">
                <a href="/usr/member/findLoginId">
                	<span>아이디 찾기</span>
                </a>
                <a href="/usr/member/findLoginPw">
                	<span>패스워드 찾기</span>
                </a>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>