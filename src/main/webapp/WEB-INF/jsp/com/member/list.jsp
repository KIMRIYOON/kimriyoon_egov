<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자관리</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
</head>
<body>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 --> 

	<!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>사이트관리</li>
                            <li>&gt;</li>
                            <li><strong>관리자관리</strong></li>
                        </ul>
                    </div>
                </div>
                
                <!-- div id="page_info"><div id="page_info_align">총 <strong>321</strong>건 (<strong>1</strong> / 12 page)</div></div-->                    
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호,사용자아이디,이메일,레벨,등록일시,휴면계정   목록입니다" cellpadding="0" cellspacing="0">
                    <caption>관리자관리 목록</caption>
                    <colgroup>
                    <col width="10%">
                    <col width="15%">  
                    <col width="10%">
                    <col width="32%">
                    
                    <col width="10%">
                    <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">번호</th>
                        <th scope="col" nowrap="nowrap">아이디</th>
                        <th scope="col" nowrap="nowrap">이메일</th>
                        <th scope="col" nowrap="nowrap">레벨</th>
                        <th scope="col" nowrap="nowrap">등록일자</th>
                        <th scope="col" nowrap="nowrap">휴면여부</th>
                    </tr>
                    </thead>
                    <tbody>                 

                    <c:forEach var="result" items="${memberList}" varStatus="status">
                    <!-- loop 시작 -->                                
                      <tr>
			            <td nowrap="nowrap"><strong><c:out value="${status.count}"/></strong></td>      
			                 
			            <td nowrap="nowrap">
			                <a href="<c:url value='/com/member/viewMember.do'/>?EMPLYR_ID=<c:out value='${result.EMPLYR_ID}'/>">
			                    <c:out value="${result.EMPLYR_ID}"/>
			                </a>
			            </td>
			
			            <td nowrap="nowrap"><c:out value="${result.EMAIL_ADRES}"/></td>
			            <td nowrap="nowrap"><c:out value="${result.GROUP_ID}"/></td>
			            <td nowrap="nowrap">
			            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${result.SBSCRB_DE}" />
			            </td>
			            <td nowrap="nowrap">
			                <c:if test="${result.EMPLYR_STTUS_CODE != 'P'}"><spring:message code="button.notUsed" /></c:if>
			                <c:if test="${result.EMPLYR_STTUS_CODE == 'P'}"><spring:message code="button.use" /></c:if>
			            </td>  
			                   
			          </tr>
			         </c:forEach>     
			         <c:if test="${fn:length(memberList) == 0}">
			          <tr>
			            <td nowrap colspan="5" ><spring:message code="common.nodata.msg" /></td>  
			          </tr>      
			         </c:if>
                    </tbody>
                    </table>
                </div>
                
                <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                  <!-- 목록/저장버튼  -->
                  <table border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td>
                          <a href="<c:url value='/com/member/insertMember.do' />">
                          <spring:message code="button.create" />
                          </a>
                      </td>
                      <td width="10"></td>
                      
                    </tr>
                  </table>
                </div>
          	 	<!-- 버튼 끝 -->
                 
            </div>
            <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->

	<!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>