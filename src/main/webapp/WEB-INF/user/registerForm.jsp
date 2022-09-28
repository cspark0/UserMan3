<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script src="<c:url value='/js/jquery-1.12.4.min.js'/>" type="text/javascript"></script>
<script>
function userCreate() {
	if (form.userId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	form.submit();
}

function userList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
<script>
$(document).ready(function() {	
	// Ajax를 통해 커뮤니티 목록 정보를 요청 (jQuery 이용)
	$.ajax({			// 비동기적인 Ajax request 발생 및 결과 처리
		type: "GET",
		url: "<c:url value='/community/list/json'/>",
		cache: false,
		dataType: "json",	// 결과는 JSON 형식의 data (Console에 출력되는 log 참조)
		success:  function(commList) {  // 요청에 대한 응답 수신 시 호출되는 callback function
					// commList는 JSON text로부터 생성된 JS 객체						
			// 전송된 커뮤니티 목록 정보를 이용하여 Select 메뉴 생성
			$("#commSelect").empty().append("<option value='0'>없음</option>");
			for (var i = 0; i < commList.length; i++) {				
				$("#commSelect").append(document.createElement("option"));	
				$("#commSelect option:last-child").attr("value", commList[i].id);	
				$("#commSelect option:last-child").append(commList[i].name);
			}	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});
});

/*
var request = new XMLHttpRequest();

function getCommunityList() {
	// Ajax를 이용하여 커뮤니티 목록 정보를 요청
	request.open("GET", "${pageContext.request.contextPath}/community/list/json?t=" + new Date().getTime(), true);
	request.onreadystatechange = showCommunityList;
	request.send(null);
}

function showCommunityList() {
	// 전송된 커뮤니티 목록 정보를 이용하여 Select 메뉴 생성
	if (request.readyState == 4 && request.status == 200) {
		// Get the response from the server 
		var commList = JSON.parse(request.responseText);
		var select = document.getElementById("commSelect");
		var i;
		for (i = 0; i < commList.length; i++) {				
			var option = document.createElement("option");
			option.setAttribute("value", commList[i].id)
			var name = document.createTextNode(commList[i].name);
			option.appendChild(name);
			select.appendChild(option);			    	
		}				 
	}
}
*/
</script>
</head>
<body> <!-- onload="getCommunityList()"> -->	
<!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/user/register' />">
  <table style="width: 100%">
    <tr>
      <td width="20"></td>
	  <td>
	    <table>
		  <tr>
		    <td class="title">&nbsp;&nbsp;<b>사용자 관리 - 회원 가입</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  	 
	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${registerFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
	    <br>	  
	    <table class="uTable">
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">사용자 ID</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240;" name="userId">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">비밀번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="password">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">비밀번호 확인</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="password2">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">이름</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="name" 
				 	<c:if test="${registerFailed}">value="${user.name}"</c:if>>
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">이메일 주소</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="email" 
					<c:if test="${registerFailed}">value="${user.email}"</c:if>>
			</td>
		  </tr>	
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">전화번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="phone" 
					<c:if test="${registerFailed}">value="${user.phone}"</c:if>>
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">커뮤니티</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<select id="commSelect" name="commId" style="width: 240"> 
					<option value="0">없음</option>
				</select>
			</td>
		  </tr>		  
	    </table>
	    <br>
	    <table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="회원 가입" onClick="userCreate()"> &nbsp;
			<input type="button" value="목록" onClick="userList('<c:url value='/user/list' />')">
			</td>
		  </tr>
	    </table>
	  </td>
    </tr>
  </table>  
</form>
</body>
</html>