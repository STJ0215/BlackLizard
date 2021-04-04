<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="로그인 패스워드 찾기" />
<%@ include file="../part/head_2.jspf"%>
        
        <script>
            var findLoginPwFormSubmitDone = false;
            
            function findLoginPwFormSubmit(form) {
                if (findLoginPwFormSubmitDone) {
                    alert('처리중입니다.');
                    
                    return;
                }
                
                form.loginId.value = form.loginId.value.trim();
                if (form.loginId.value.length == 0) {
                    alert('로그인 아이디를 입력해 주세요.');
                    form.loginId.focus();
                    
                    return;
                }
                
                form.email.value = form.email.value.trim();
                if (form.email.value.length == 0) {
                    alert('이메일을 입력해 주세요.');
                    form.email.focus();
                    
                    return;
                }
                
                form.submit();
                findLoginPwFormSubmitDone = true;
            }
        </script>
        
        <div class="find-login-pw-box con-min-width">
            <div class="con">
            	<a href="/" class="logo-login block img-box">
                   	<img src="/resource/img/BlackLizard-logo_500px.png">
                </a>
                <form class="form-box-type-1" action="doFindLoginPw" method="POST" onsubmit="findLoginPwFormSubmit(this); return false;">
                    <div>
                        <div>
                            <span>로그인 아이디 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="로그인 아이디를 입력해 주세요." name="loginId"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>이메일 :</span>
                        </div>
                        <div>
                            <input type="email" maxlength="50" placeholder="이메일을 입력해 주세요." name="email"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <input type="submit" value="확인"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%> 