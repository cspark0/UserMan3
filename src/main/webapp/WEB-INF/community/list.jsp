<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 관리 - 목록</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>

<div class="container">  
	<br>
	<h4>커뮤니티 목록 (by MyBatis)</h4>
	<br>
	<table class="table table-bordered">
      <thead class="thead-inverse">
		<tr>
		  <td>이름</td>
		  <td>설명</td>
		  <td>회원 수</td>
		</tr>
      </thead>
      <tbody>  	 
		<c:forEach var="comm" items="${commList}">
			<tr>
			  <td><a href="<c:url value='/community/view'>
						      <c:param name='commId' value='${comm.id}'/>
						   </c:url>">
				  ${comm.name}</a>
			  </td>
			  <td>${comm.description}</td>
			  <td>${comm.numOfMembers}</td>
			</tr>
		</c:forEach>
	  </tbody>
	</table>	  	 
	<br>   
	<a href="<c:url value='/community/create/form' />" class="btn btn-primary">커뮤니티 생성</a> 
</div>
</body>
</html>