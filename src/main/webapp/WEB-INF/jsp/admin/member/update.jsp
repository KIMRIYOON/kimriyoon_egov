<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0 text-dark">DashBoard Management</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Starter Page</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<div class="col-md-12">
				<!-- general form elements disabled -->
				<div class="card card-warning">
					<div class="card-header">
						<h3 class="card-title">Update Member</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form id="updateForm" role="form" action="<c:url value='/' />admin/member/updateMember.do" method="post">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label>사용자아이디</label> 
										<input type="text" class="form-control"
											id="EMPLYR_ID" name="EMPLYR_ID" value="${memberVO.EMPLYR_ID}" readonly="">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>사용자 암호</label> 
										<input type="text" class="form-control"
											name="PASSWORD" value="">
									</div>
								</div>
								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>사용자 이름</label> <input type="text" class="form-control"
											name="USER_NM" value="${memberVO.USER_NM}">
									</div>
								</div>

								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>우편번호</label> <input type="text" class="form-control"
											name="ZIP" value="${memberVO.ZIP}">
									</div>
								</div>

								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>집주소</label> <input type="text" class="form-control"
											name="HOUSE_ADRES" value="${memberVO.HOUSE_ADRES}">
									</div>
								</div>
									<div class="col-sm-12">
									<div class="form-group">
										<label>이메일</label> <input type="text" class="form-control"
											name="EMAIL_ADRES" value="${memberVO.EMAIL_ADRES}">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>권한레벨</label> 
										<select name="GROUP_ID" class="form-control">
				       				 	  <c:forEach var="auth" items="${authVO}">
				       				 		<option value="${auth.GROUP_ID}"
				       				 		<c:if test="${auth.GROUP_ID==memberVO.GROUP_ID}"></c:if>
		   				 			  		>
			       					 		${auth.GROUP_NM}</option>
				       				 	  </c:forEach>
				       				 	</select>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>소속기관</label> <input type="text" class="form-control"
											name="ORGNZT_ID" value="${memberVO.ORGNZT_ID}">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>휴면계정여부</label> <input type="text" class="form-control"
											name="EMPLYR_STTUS_CODE" value="${memberVO.EMPLYR_STTUS_CODE}">
									</div>
								</div>
								<div class="form-group">
                      </div>
                    <input type="hidden" name="ESNTL_ID" value="${memberVO.ESNTL_ID}" /> 
                    <input type="hidden" name="PASSWORD_HINT" value="${memberVO.PASSWORD_HINT}" /> 
                    <input type="hidden" name="PASSWORD_CNSR" value="${memberVO.PASSWORD_CNSR}" />
                   	<div class = "buttons">
								<button type="submit" class="btn btn-warning">UPDATE</button>
								<button type="button" onclick="history.back()" class="btn btn-primary">이전페이지</button>
							</div>
							</div>
							
						</form>
					</div>
					<!-- /.content-header -->

					<!-- Main content -->
					<div class="content"></div>
					<!-- .content  -->
				</div>
			</div>
		</div>
	</div>
<!-- ./Contents Wrap -->
  
<%@ include file="../include/footer.jsp" %>