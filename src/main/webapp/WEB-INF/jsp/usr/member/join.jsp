<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="title" value="회원 가입"/>
<%@ include file="../part/head.jspf"%>
        
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
        
        <form action="doJoin" method="POST" onsubmit="joinFormSubmit(this); return false;">
            <div>
                아이디 : <input type="text" maxlength="30" placeholder="로그인 아이디를 입력해 주세요." name="loginId"/>
            </div>
            <div>
                패스워드 : <input type="password" maxlength="30" placeholder="로그인 패스워드를 입력해 주세요." name="loginPw"/>
            </div>
            <div>
                패스워드 확인 : <input type="password" maxlength="30" placeholder="로그인 패스워드를 다시 입력해 주세요." name="loginPwConfirm"/>
            </div>
            <div>
                이름 : <input type="text" maxlength="30" placeholder="이름을 입력해 주세요." name="name"/>
            </div>
            <div>
            	이메일 : <input type="email" maxlength="50" placeholder="이메일 주소를 입력해 주세요." name="email"/>
            </div>
            <div>
                가입 : <input type="submit" value="가입"/>
            </div>
        </form>
<%@ include file="../part/foot.jspf"%>