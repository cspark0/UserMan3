<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 관리 - 조회</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function communityRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>

<div class="container">  
	<br>
	<h4>커뮤니티 정보 조회</h4>
	<br>
	<table class="table table-sm table-striped">
    	<tbody> 
	  	  <tr>
			<th>커뮤니티 ID</th>
			<td>${community.id}</td>
		  </tr>
		  <tr>
			<th>이름</th>
			<td>${community.name}</td>
		  </tr>
		  <tr>
			<th>설명</th>
			<td>${community.description}</td>
		  </tr>
		  <tr>
			<th>개설일자</th>
			<td>${community.startDate}</td>
		  </tr>
		  <tr>
			<th>회원 수</th>
			<td>${community.numOfMembers}</td>
		  </tr>
		  <tr>
			<th>회장</th>
			<td>
				<a href="<c:url value='/user/view'>
					   		<c:param name='userId' value='${community.chairId}'/>
			 		 	 </c:url>">
					${community.chairId}</a>
			</td>
		  </tr>
		  <tr>
			<th>회원</th>
			<td>
				<c:forEach var="member" items="${community.memberList}">
					<a href="<c:url value='/user/view'>
					   			<c:param name='userId' value='${member.userId}'/>
			 		 		 </c:url>">
						${member.userId}</a>
				</c:forEach>
			</td>
		  </tr>
		</tbody>
	</table>
	<br> 		     
    <a class="btn btn-primary" 
    	href="<c:url value='/community/update'>
	     		   <c:param name='commId' value='${community.id}'/>
			  </c:url>">수정</a>
    <a class="btn btn-warning" 
   		href="<c:url value='/community/delete'>
				   <c:param name='commId' value='${community.id}'/>
			 </c:url>" onclick="return communityRemove();">삭제(미구현)</a>
    <a class="btn btn-success" href="<c:url value='/community/list' />">커뮤니티 목록</a> 
    <br>	   
	    
	<!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<c:if test="${updateFailed}">
		<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
    </c:if>  
</div>  
</body>
</html>