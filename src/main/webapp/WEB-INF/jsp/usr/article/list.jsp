<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="title" value="${board.name}"/>
<%@ include file="../part/head.jspf"%>
        
        <div class="articles-info-bar con-min-width">
            <div class="con">
                <span>총 게시물 갯수 :</span>
                <span>${totalCount}</span>
            </div>
        </div>
        
        <div class="con-min-width">
            <div class="con">
                <form class="">
                    <div class="searchKeyword-box">
                        <div class="searchKeyword-input">
                            <input type="text" placeholder="검색어 입력" name="searchKeyword" value="${param.searchKeyword}">
                        </div>
                        <div class="searchKeyword-submit">
                            <input type="submit" value="검색">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="article-list-box con-min-width margin-top-30">
            <div class="con">
                <div class="article-list-box__head">
                    <div class="article-list-box__row">
                        <div>
                            <span>ID</span>
                        </div>
                        <div>
                            <span>등록일</span>
                        </div>
                        <div>
                            <span>수정일</span>
                        </div>
                        <div>
                            <span>작성자</span>
                        </div>
                        <div>
                            <span>제목</span>
                        </div>
                        <div>
                        	<!--
                        	<span>작업</span>
                        	-->
                        </div>
                    </div>
                </div>
                <div class="article-list-box__body">
                    <c:forEach var="article" items="${articles}">
                        <c:set var="detailUrl" value="/usr/article-${board.code}/detail?id=${article.id}&listUrl=${encodedCurrentUri}"/>
                        <div class="article-list-box__row">
                            <div>
                                <a href="${detailUrl}">${article.id}</a>
                            </div>
                            <div>
                                <span>${article.regDate}</span>
                            </div>
                            <div>
                                <span>${article.updateDate}</span>
                            </div>
                            <div>
                                <span>${article.extra.writer}</span>
                            </div>
                            <div>
                                <a href="${detailUrl}">${article.title}</a>
                            </div>
                            
                            <div>
                                <c:if test="${article.extra.actorCanModify}">
                                    <a href="modify?id=${article.id}">수정</a>
                                </c:if>
                                <c:if test="${article.extra.actorCanDelete}">
                                    <a href="doDelete?id=${article.id}" 
                                        onclick="if (confirm('삭제하시겠습니까?') == false) return false;">삭제</a>
                                </c:if>
                            </div>                        
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        

        
        <div class="sub-menu-bar con-min-width">
            <div class="con">
                <a href="write">게시물 작성</a>
            </div>
        </div>
        
        <br>
        
        <div class="article-page-box con-min-width">
            <c:set var="goFirstBtnNeedToShow" value="${page > pageMenuArmSize + 1}"/>
            <c:set var="goLastBtnNeedToShow" value="true"/>
            
            
            <c:if test="${0 == totalPage}">
                <c:set var="goFirstBtnNeedToShow" value="false" />
            </c:if>
            
            <c:if test="${goFirstBtnNeedToShow}">
                <a href="?page=1&searchKeyword=${param.searchKeyword}">◀◀</a>
            </c:if>
            
            <c:forEach var="i" begin="${pageMenuStart}" end="${pageMenuEnd}">
                <c:set var="className" value="${i == page ? 'article-page-box__page-btn--selected' : ''}"/>
                <a href="?page=${i}&searchKeyword=${param.searchKeyword}" class="${className}">${i}</a>
                
                <c:if test="${i == totalPage}">
                    <c:set var="goLastBtnNeedToShow" value="false"/>
                </c:if>
            </c:forEach>
            
            <c:if test="${0 == totalPage}">
                <c:set var="goLastBtnNeedToShow" value="false" />
            </c:if>
            
            <c:if test="${goLastBtnNeedToShow}">
                <a href="?page=${totalPage}&searchKeyword=${param.searchKeyword}">▶▶</a>
            </c:if>
        </div>
<%@ include file="../part/foot.jspf"%>