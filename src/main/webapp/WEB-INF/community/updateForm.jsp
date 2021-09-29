<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 관리 - 수정</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function commModify() {
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	} 
	if (form.desc.value == "") {
		alert("설명을 입력하십시오.");
		form.desc.focus();
		return false;
	}	
	form.submit();
}
</script>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>

<div class="container">  
	<br>
	<h4>커뮤니티 수정</h4>
	<br>
	<!-- Update Form  -->
	<form name="form" method="POST" action="<c:url value='/community/update' />">
		<input type="hidden" name="commId" value="${community.id}"/>	  
	  	<div class="form-group row">   
	        <label class="col-lg-2 col-form-label">커뮤니티 ID</label>
	        <div class="col-lg-10">
	        	<p class="form-control-static">${community.id}</p> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label for="name" class="col-lg-2 col-form-label">이름</label>
	        <div class="col-lg-10">
	            <input type="text" name="name" class="form-control" value="${community.name}"> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label for="desc" class="col-lg-2 col-form-label">설명</label>
	        <div class="col-lg-10">
	            <input type="text" name="desc" class="form-control" value="${community.description}"> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label class="col-lg-2 col-form-label">개설일자</label>
	        <div class="col-lg-10">
	        	<p class="form-control-static">${community.startDate}</p> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label class="col-lg-2 col-form-label">회원 수</label>
	        <div class="col-lg-10">
	        	<p class="form-control-static">${community.numOfMembers}</p> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label for="password" class="col-lg-2 col-form-label">회장</label>
	        <div class="col-lg-10">
	            <select name="chairId" class="form-control">
					<option value="">없음</option>
					<c:forEach var="member" items="${community.memberList}">
						<option value="${member.userId}"
							<c:if test="${member.userId eq community.chairId}">selected="selected"</c:if>
							>${member.userId}</option>
					</c:forEach>
				</select>
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label class="col-lg-2 col-form-label">회원</label>
	        <div class="col-lg-10">
	            <p class="form-control-static">
	            	<c:forEach var="member" items="${community.memberList}">
						${member.userId} &nbsp; 
					</c:forEach>
				</p>
	        </div>
	    </div>    
	    <br>
		<div class="form-group">        
			<input type="button" class="btn btn-primary" value="수정" onClick="commModify()">
			<a href="<c:url value='/community/view'>
				      	<c:param name='commId' value='${community.id}'/>
				     </c:url>" class="btn btn-link">조회</a>
			<a href="<c:url value='/community/list' />" class="btn btn-link">커뮤니티 목록</a>     
		</div>	 
	</form>
</div>
</body>
</html>