<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="로그인 패스워드 확인"/>
<%@ include file="../part/head.jspf"%>
		
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
        
        <script>
            var checkLoginPwFormSubmitDone = false;
            
            function checkLoginPwFormSubmit(form) {
                if (checkLoginPwFormSubmitDone) {
                    alert('처리중입니다.');
                    
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
                checkLoginPwFormSubmitDone = true;
            }
        </script>
        
        <div class="check-login-pw-box con-min-width">
            <div class="con">
                <form class="form-box-type-2" action="doCheckLoginPw" method="POST" onsubmit="checkLoginPwFormSubmit(this); return false;">
                    <input type="hidden" name="redirectUri" value="/usr/member/modify"/>
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
                            <span>확인 :</span>
                        </div>
                        <div>
                            <input type="submit" value="패스워드 확인"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>