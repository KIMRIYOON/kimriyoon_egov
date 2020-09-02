<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springmodules.org/tags/commons-validator" prefix="validator" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
    function onloading() {
        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.board.pageIndex.value = pageNo; 
        document.board.action = "<c:url value='/admin/board/selectBoard.do'/>";
        document.board.submit();  
    }
    
    function fn_egov_delete_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.board.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.board.password.focus();
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.board.action = "<c:url value='/admin/board/deleteBoard.do'/>";
            document.board.submit();
        }   
    }
    
    function fn_egov_moveUpdt_notice() {
        
        if (!validateBoard(document.board)){
            return;
        }
        
        if (confirm('<spring:message code="common.update.msg" />')) {
            document.board.action = "<c:url value='/admin/board/updateBoard.do'/>";
            document.board.submit();                    
        }
    }
    
    function fn_egov_addReply() {
        document.board.action = "<c:url value='/admin/board/insertReply.do'/>";
        document.board.submit();          
    }
    
    function fn_egov_check_file(flag) {
        if (flag=="Y") {
            document.getElementById('file_upload_posbl').style.display = "block";
            document.getElementById('file_upload_imposbl').style.display = "none";          
        } else {
            document.getElementById('file_upload_posbl').style.display = "none";
            document.getElementById('file_upload_imposbl').style.display = "block";
        }
    }
</script>
<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<h1 class="m-0 text-dark">DashBoard Management</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-12">
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
							<h3 class="card-title">READ BOARD</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
								<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<input type="hidden" name="returnUrl" value="<c:url value='/admin/board/viewBoard.do'/>"/>
								
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
								
								<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
								<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
								<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
								<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
								<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
								<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
								<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
								
								<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
								
								<c:if test="${anonymous != 'true'}">
									<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
									<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
								</c:if>
								
								<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
								   <input name="ntceBgnde" type="hidden" value="10000101">
								   <input name="ntceEndde" type="hidden" value="99991231">
								</c:if>
								<div class="row">
									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>제목</label> 
											<input id="nttSj" name="nttSj" value="${result.nttSj}" type="text" class="form-control"
												placeholder="" >
											<br/><form:errors path="nttSj" />
										</div>
									</div>

									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>글내용</label>
											<textarea id="nttCn" name="nttCn" class="form-control" rows="3"
												placeholder="" >${result.nttCn}</textarea>
											<form:errors path="nttCn" />
										</div>
									</div>

									<div class="col-sm-4">
										<!-- text input -->
										<div class="form-group">
											<label>작성자</label> 
											<input name="frstRegisterNm" value="${result.frstRegisterNm}" type="text" class="form-control"
												placeholder="" readonly>
										</div>
									</div>
									<div class="col-sm-4">
										<!-- text input -->
										<div class="form-group">
											<label>작성시간</label> 
											<input value="${result.frstRegisterPnttm}" type="text" class="form-control"
												placeholder="" disabled>
										</div>
									</div>
									<div class="col-sm-4">
										<!-- text input -->
										<div class="form-group">
											<label>조회수</label> 
											<input value="${result.inqireCo}" type="text" class="form-control"
												placeholder="" disabled>
										</div>
									</div>
									<c:if test="${not empty result.atchFileId}">
										<div class="form-group col-12">
							                <label>업로드된 첨부파일</label>
							                <div>
							                <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
							                </c:import>
							                </div>
							                <div class="filename">
							                <c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
							                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
							                </c:import>
							                </div>
							            </div>
								    </c:if>
									<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
										<!-- text input -->
										<div class="form-group col-12">
											<label>첨부파일</label> 
											<div id="file_upload_posbl"  style="display:none;" >    
								                        <input name="file_1" id="egovComFileUploader" type="file" class="form-control" />
								                            <div id="egovComFileList"></div>
								            </div>
								            <div id="file_upload_imposbl"  style="display:none;" >
								            </div>
								            <c:if test="${empty result.atchFileId}">
				                                <input type="hidden" name="fileListCnt" value="0" />
				                            </c:if>
										</div>
								    </c:if>
									<div class="buttons">
										<button type="button" onclick="javascript:fn_egov_moveUpdt_notice(); return false;" class="btn btn-warning">수정</button>
										<button type="button" onclick="javascript:fn_egov_delete_notice(); return false;" class="btn btn-danger">삭제</button>
										<button type="button" onclick="javascript:fn_egov_select_noticeList('1'); return false;" class="btn btn-primary">목록</button>
										<button type="button" onclick="javascript:fn_egov_addReply(); return false;" class="btn btn-info">답변</button>
									</div>
								</div>

							</form:form>
						</div>
						<!-- /.content-header -->


						
						
					</div>
				</div>
			</div>
			</div>
		<!-- //Content Wrapper -->

<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
<script type="text/javascript">
var existFileNum = document.board.fileListCnt.value;        
var maxFileNum = document.board.posblAtchFileNumber.value;

if (existFileNum=="undefined" || existFileNum ==null) {
    existFileNum = 0;
}
if (maxFileNum=="undefined" || maxFileNum ==null) {
    maxFileNum = 0;
}       
var uploadableFileNum = maxFileNum - existFileNum;
if (uploadableFileNum<0) {
    uploadableFileNum = 0;
}               
if (uploadableFileNum != 0) {
    fn_egov_check_file('Y');
    var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
    multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
} else {
    fn_egov_check_file('N');
}           
</script>

</c:if>

<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){
	onloading();//함수명만 있으면 실행이 됩니다.
});
</script>