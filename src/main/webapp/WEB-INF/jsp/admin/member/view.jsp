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
						<h3 class="card-title">READ Member</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form id="form_delete" role="form" action="<c:url value='/' />admin/member/deleteMember.do" method="post">
							<div class="row">
								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>사용자아이디</label> 
										<input type="text" class="form-control"
											name="EMPLYR_ID" value="${memberVO.EMPLYR_ID}" readonly="">
									</div>
								</div>

								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>사용자 이름</label> <input type="text" class="form-control"
											name="USER_NM" value="${memberVO.USER_NM}" disabled="">
									</div>
								</div>

								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>우편번호</label> <input type="text" class="form-control"
											name="ZIP" value="${memberVO.ZIP}" disabled="">
									</div>
								</div>

								<div class="col-sm-12">
									<!-- text input -->
									<div class="form-group">
										<label>집주소</label> <input type="text" class="form-control"
											name="HOUSE_ADRES" value="${memberVO.HOUSE_ADRES}"disabled="">
									</div>
								</div>
									<div class="col-sm-12">
									<div class="form-group">
										<label>이메일</label> <input type="text" class="form-control"
											name="EMAIL_ADRES" value="${memberVO.EMAIL_ADRES}"disabled="">
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
											name="ORGNZT_ID" value="${memberVO.ORGNZT_ID}"disabled="">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>휴면계정여부</label> <input type="text" class="form-control"
											name="EMPLYR_STTUS_CODE" value="${memberVO.EMPLYR_STTUS_CODE}"disabled="">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>등록일</label> <input type="text" class="form-control"
											name="SBSCRB_DE" value="${memberVO.SBSCRB_DE}"disabled="">
									</div>
								</div>
								<div class="form-group">
                      </div>
                    <div class = "buttons">
								<button type="button" onclick='location.href="<c:url value='/' />admin/member/updateMember.do?EMPLYR_ID=${memberVO.EMPLYR_ID}"'class="btn btn-warning">UPDATE</button>
								<button type="button" id="btn_delete" class="btn btn-danger">DELETE</button>
								<button type="button" onclick='location.href="<c:url value='/' />admin/member/selectMember.do"' class="btn btn-primary">LIST ALL</button>
							</div>
							</div>
							
						</form>
					</div>
					<!-- /.content-header -->

					<!-- Main content -->
					<div class="content"></div>
					<!-- .content  -->
				</div>
				<!-- Control Sidebar -->
				<aside class="control-sidebar control-sidebar-dark">
					<!-- Control sidebar content goes here -->
					<div class="p-3">
						<h5>Title</h5>
						<p>Sidebar content</p>
						<button type="button" class="btn btn-primary btn-lg btn-block">로그아웃</button>
					</div>
				</aside>
				<!-- /.control-sidebar -->
			</div>
		</div>
	</div>
<!-- ./Contents Wrap -->
  
<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){
	("#btn_delete").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			$("#form_delete").submit();
		}
	});
});
</script>