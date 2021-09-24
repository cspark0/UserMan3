<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>커뮤니티 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/community.css' />" type="text/css">
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

function commList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
</head>
<body>
<br>
<!-- Update Form  -->
<form name="form" method="POST" action="<c:url value='/community/update' />">
  <input type="hidden" name="commId" value="${community.id}"/>	  
  <table style="width: 100%">
	<tr>
	  <td width="20"></td>
	  <td>
	    <table>
		  <tr>
			<td class="title">&nbsp;&nbsp;<b>커뮤니티 관리 - 수정</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
	    <br>	  
	    <table class="commTable">
	  	  <tr height="40">
			<td class="commHead">커뮤니티 ID</td>
			<td class="commCell">${community.id}</td>
		  </tr>
		  <tr height="40">
			<td class="commHead">이름</td>
			<td class="commCell">
				<input type="text" style="width: 240" name="name" value="${community.name}">
			</td>
		  </tr>
		  <tr height="40">
			<td class="commHead">설명</td>
			<td class="commCell">
				<input type="text" style="width: 240" name="desc" value="${community.description}">
			</td>
		  </tr>
		  <tr height="40">
			<td class="commHead">개설일자</td>
			<td class="commCell">${community.startDate}</td>
		  </tr>
		  <tr height="40">
			<td class="commHead">회원 수</td>
			<td class="commCell">${community.numOfMembers}</td>
		  </tr>	
		  <tr height="40">
			<td class="commHead">회장</td>
			<td class="commCell">
	 			<select name="chairId" style="width: 240" >
					<option value="">없음</option>
					<c:forEach var="member" items="${community.memberList}">
						<option value="${member.userId}"
							<c:if test="${member.userId eq community.chairId}">selected="selected"</c:if>
							>${member.userId}</option>
					</c:forEach>
				</select>			
			</td>
		  </tr>		
		  <tr height="40">
			<td class="commHead">회원</td>
			<td class="commCell">
				<c:forEach var="member" items="${community.memberList}">
					${member.userId} &nbsp;
				</c:forEach>
			</td>			
		  </tr>	
	    </table>
	    <br>	  
	    <table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="수정" onClick="commModify()"> &nbsp;
			<input type="button" value="목록" onClick="commList('<c:url value='/community/list' />')">
			</td>
		  </tr>
	    </table>
	  </td>
	</tr>
  </table>  
</form>
</body>
</html>