<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	@SuppressWarnings("unchecked") 
	List<Community> commList = (List<Community>)request.getAttribute("commList");
%> --%>
<html>
<head>
<title>커뮤니티 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/community.css' />" type="text/css">
</head>
<body>
<br>
<table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
	<td width="20"></td>
	<td>
	  <table>
		<tr>
		  <td class="title">&nbsp;&nbsp;<b>커뮤니티 관리 - 리스트</b>&nbsp;&nbsp;</td>
		</tr>
	  </table>  
	  <br>		  
	  <table class="commTable">
		<tr>
		  <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
		  <th class="commHead">이름</th>
		  <th class="commHead">설명</th>
		  <th class="commHead">회원 수</th>
		</tr>
		<c:forEach var="comm" items="${commList}">
			<tr>
			  <td class="commCell">			
				  <a href="<c:url value='/community/view'>
						   <c:param name='commId' value='${comm.id}'/>
						 </c:url>">
				  ${comm.name}</a>
			  </td>
			  <td class="commCell">
				  ${comm.description}
			  </td>
			  <td class="commCell">
				  ${comm.numOfMembers}
			  </td>
			</tr>
		</c:forEach>
	  </table>	  	 
	  <br>   
	  <a href="<c:url value='/community/create/form' />">커뮤니티 추가</a> 
	  <br>
	  <a href="<c:url value='/user/list' />">사용자 목록</a>
	</td>
  </tr>
</table>  
</body>
</html>