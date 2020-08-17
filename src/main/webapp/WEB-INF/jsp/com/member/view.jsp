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
                
           	<form:form commandName="viewForm" name="viewForm" method="get">
              	
                <div class="modify_user" >
           		 	<table >
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						사용자 아이디
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.EMPLYR_ID}"></c:out>
	       				 	<input id="EMPLYR_ID" name="EMPLYR_ID" type="hidden" value="${memberVO.EMPLYR_ID}" />
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						사용자 이름
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.USER_NM}"></c:out>
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						우편번호
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.ZIP}"></c:out>
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						집 주소
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.HOUSE_ADRES}"></c:out>
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						이메일
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.EMAIL_ADRES}"></c:out>
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
	       				 	<c:out value="${memberVO.ORGNZT_ID}"></c:out>
	       				</td>
     				 </tr>
     				 <tr> 
  					 	<th width="20%" height="23" class="required_text" nowrap >
       						휴면계정여부
        				</th>
	       				<td width="80%" nowrap="nowrap">
	       				 	<c:out value="${memberVO.EMPLYR_STTUS_CODE}"></c:out>
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
                              <a href="#LINK" id="delete_member">
                              <spring:message code="button.delete" />
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
	
	${"#delete_member"}.click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			
		}else{
			return false;
		}
		$("#viewForm").attr("action","<c:url value='/com/member/deleteMember.do' />");
		$("#viewForm").attr("method", "post");
		$("#viewForm").submit();
	});
	$("#update_member").click(function(){
		$("#viewForm").attr("action","<c:url value='/com/member/updateMember.do' />");
		$("#viewForm").submit();
	});
	
});
</script>

</body>
</html>