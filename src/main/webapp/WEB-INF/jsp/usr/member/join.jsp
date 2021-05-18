<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="회원 가입"/>
<%@ include file="../part/head_2.jspf"%>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
        
        <script>
            var joinFormSubmitDone = false;
            
            function joinFormSubmit(form) {
                if (joinFormSubmitDone) {
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

                form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
                if (form.loginPw.value != form.loginPwConfirm.value) {
                    alert('로그인 패스워드가 일치하지 않습니다.');
                    form.loginPwConfirm.focus();

                    return;
                }
                
                form.name.value = form.name.value.trim();
                if (form.name.value.length == 0) {
                    alert('이름을 입력해 주세요.');
                    form.name.focus();

                    return;
                }

                form.email.value = form.email.value.trim();
                if (form.email.value.length == 0) {
                    alert('이메일 주소를 입력해 주세요.');
                    form.email.focus();

                    return;
                }

                form.loginPw.value = sha256(form.loginPw.value);
                form.loginPwConfirm.value = '';
                    
                form.submit();
                joinFormSubmitDone = true;
            }
        </script>
        
        <div class="join-box con-min-width">
            <div class="con">
            	<a href="/" class="logo-login block img-box">
                   	<img src="/resource/img/BlackLizard_logo_500px.png">
                </a>
                <form class="form-box-type-01" action="doJoin" method="POST" onsubmit="joinFormSubmit(this); return false;">
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
                            <span>패스워드 확인 :</span>
                        </div>
                        <div>
                            <input type="password" maxlength="30" placeholder="로그인 패스워드 확인" name="loginPwConfirm"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>이름 :</span>
                        </div>
                        <div>
                            <input type="text" maxlength="30" placeholder="이름을 입력해 주세요." name="name"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>이메일 :</span>
                        </div>
                        <div>
                            <input type="email" maxlength="50" placeholder="이메일 주소를 입력해 주세요." name="email"/>
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <input type="submit" class="button-join" value="가입"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%>