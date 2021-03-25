<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="로그인 아이디 찾기" />
<%@ include file="../part/head.jspf"%>
        
        <script>
            var findLoginIdFormSubmitDone = false;
            
            function findLoginIdFormSubmit(form) {
                if (findLoginIdFormSubmitDone) {
                    alert('처리중입니다.');
                    
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
                    alert('이메일을 입력해 주세요.');
                    form.email.focus();
                    
                    return;
                }
                
                form.submit();
                loginFormSubmitDone = true;
            }
        </script>
        
        <div class="find-login-id-box con-min-width">
            <div class="con">
                <form class="form-box-type-1" action="doFindLoginId" method="POST" onsubmit="findLoginIdFormSubmit(this); return false;">
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
                            <input type="email" maxlength="50" placeholder="이메일을 입력해 주세요." name="email"/>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>찾기 :</span>
                        </div>
                        <div>
                            <input type="submit" value="찾기"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%@ include file="../part/foot.jspf"%> 