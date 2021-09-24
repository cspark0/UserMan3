<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>커뮤니티 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/community.css' />" type="text/css">
<script>
function commCreate() {
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

function commList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
</head>
<body>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/community/create' />">
  <table style="width: 100%">
    <tr>
      <td width="20"></td>
	  <td>
	    <table>
		  <tr>
		    <td class="title">&nbsp;&nbsp;<b>커뮤니티 관리 - 생성</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
	    <br>	  	   
	    <!-- 커뮤니티 생성이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${creationFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
	    <table class="commTable">
	  	  <tr height="40">
			<td class="commHead">이름</td>
			<td class="commCell">
				<input type="text" style="width: 240" name="name" 
				 	<c:if test="${creationFailed}">value="${comm.name}"</c:if>>
			</td>
		  </tr>
	  	  <tr height="40">
			<td class="commHead">설명</td>
			<td class="commCell">
				<input type="text" style="width: 240" name="desc" 
					<c:if test="${creationFailed}">value="${comm.description}"</c:if>>
			</td>
		  </tr>	 
	    </table>
	    <br>
	    <table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="생성" onClick="commCreate()"> &nbsp;
			<input type="button" value="커뮤니티 목록" onClick="commList('<c:url value='/community/list' />')">
			</td>
		  </tr>
	    </table>
	  </td>
    </tr>
  </table>  
</form>
</body>
</html>