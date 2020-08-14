<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                
           	<form:form commandName="updateForm" name="updateForm" method="post">
              	
                <div class="modify_user" >
           		 	<table >
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						사용자 아이디
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.EMPLYR_ID}"></c:out>
	       				 	<input id="EMPLYR_ID" type="hidden" value="${memberVO.EMPLYR_ID}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						사용자 이름
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="USER_NM" type="text" value="${memberVO.USER_NM}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						우편번호
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="ZIP" type="text" value="${memberVO.ZIP}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						집 주소
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="HOUSE_ADRES" type="text" value="${memberVO.HOUSE_ADRES}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						이메일
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="EMAIL_ADRES" type="text" value="${memberVO.EMAIL_ADRES}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						권한레벨
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<select name="GROUP_ID">
	       				 	  <c:forEach var="auth" items="${authVO}">
	       				 		<option value="${auth.GROUP_ID}"
	       				 		<c:if test="${auth.GROUP_ID==memberVO.GROUP_ID}"></c:if>
   				 			  >
       					 		${auth.GROUP_NM}</option>
	       				 	  </c:forEach>
	       				 	</select>
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						소속기관
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="ORGNZT_ID" type="text" value="${memberVO.ORGNZT_ID}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						휴면계정여부
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<input name="EMPLYR_STTUS_CODE" type="text" value="${memberVO.EMPLYR_STTUS_CODE}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						등록일
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${memberVO.SBSCRB_DE}" />
	       				</td>
     				 </tr>
                    </table>
                </div>
                <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                      <!-- 목록/저장버튼  -->
                      <table border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr> 
                          <td>
                              <a href="#LINK" id="update_member">
                              <spring:message code="button.update" />
                              </a>
                          </td>
                          <td width="10"></td>
                          <td>
                              <a href="<c:url value='/com/member/selectMember.do'/>">
                              <spring:message code="button.list" />
                              </a>
                          </td>
                        </tr>
                      </table>
                    </div>
               	 <!-- 버튼 끝 -->   
           	 </form:form>         
            </div>
            <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->


    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#update_member").click(function(){
		$("#updateForm").attr("action","<c:url value='/com/member/updateMember.do' />");
		$("#updateForm").submit();
	})
	
});
</script>

</body>
</html>