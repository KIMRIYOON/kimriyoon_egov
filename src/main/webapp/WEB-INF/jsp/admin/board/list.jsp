<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">DashBoard Management</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
      <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">게시판 검색</h3>
            </div>
          </div>
       </div>
       <form name="frm" action ="<c:url value='/admin/board${prefix}/selectBoard.do'/>" method="post">
	        <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
			<input type="hidden" name="nttId"  value="0" />
			<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
			<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
			<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	        <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />
	       <div class="col-2" style="display:inline-block" >
	          <select name="searchCnd" class="form-control" title="검색조건 선택">
	           <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
	           <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>             
	           <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>            
              </select>
	        </div>
	        <div class="search" style="display:inline">
			    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
				<div class="button" style="display:inline">
				     <button>검색</button>
				</div>
				<div class="button" style="display:inline">
			     <button type="button" onclick='location.href="<c:url value='/admin/board${prefix}/insertBoard.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>"'>새글쓰기</button>
			    </div>
	        </div>
    	</form>
	</div>
        <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">LIST ALL PAGE</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap even_table">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${resultList}" var="result" varStatus="status">
                  	<tr>
                      <td><b><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></b></td>
                      <td>
                      <form name="subForm" method="post" action="<c:url value='/admin/board${prefix}/viewBoard.do'/>">
                      	<c:if test="${result.replyLc!=0}">
			                <c:forEach begin="0" end="${result.replyLc}" step="1">
			                    &nbsp;
			                </c:forEach>
			                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
			            </c:if>
                      	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                        <span class="link" style="cursor:pointer;"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>" ></span>
                      </form>
                      </td>
                      <td>
                      <c:out value="${result.frstRegisterNm}"/>
                      </td>
                      <td><span class="tag tag-success">
                      <c:out value="${result.frstRegisterPnttm}"/>
                      </span></td>
                      <td><span class="badge badge-danger right">
                      <c:out value="${result.inqireCo}"/>
                      </span></td>
                    </tr>
                  </c:forEach>                    
                  </tbody>
                </table>
                <table class="table table-hover text-nowrap">
                  <tr>
		           <td> <button type="button" onclick='location.href="<c:url value='/admin/board${prefix}/insertBoard.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>"' class="btn btn-primary">CREATE</button>
		           </td>
		           <td>
		           <style>
		           .active .page-link{
		               z-index: 3;
					   color: #fff;
					   background-color: #007bff;
					   border-color: #007bff;
					}
		           </style>
		              <nav aria-label="Contacts Page Navigation">
			            <ul class="pagination justify-content-center m-0">
			              <!-- <li class="page-item active"><a class="page-link" href="#">1</a></li> -->
			              <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
			            </ul>
			          </nav>
	               </td>
	               </tr>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
 
    
    </div>
<!-- ./Content Wrapper. Contains page content -->

<%@ include file="../include/footer.jsp" %>