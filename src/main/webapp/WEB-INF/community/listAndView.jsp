<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>커뮤니티 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/community.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

/* 
 * 커뮤니티 ID 링크를 클릭할 때 새로운 요청(/community/view/json)을 비동기적으로 발생시키고(Ajax call)
 * ViewCommunityJsonController가 생성한 JSON 형식의 검색 결과를 이용하여 
 * 커뮤니티의 상세 정보와 회원 리스트를 커뮤니티 리스트 아래에 각각 테이블로 만들어 출력시킴(DOM tree에 추가)
 */
$(document).ready(function() {	
	$(".commName").click(function() { 	// commName 클래스가 지정된 <a> 링크에 대한 이벤트 핸들러
		$.ajax({				// 비동기적인 Ajax request 발생 및 결과 처리
	   		type: "GET",
			url: "<c:url value='/community/view/json'/>"+"?commId="+$(this).attr("id"),
			cache: false,
			dataType: "json",	// 결과는 JSON 형식의 data (Console에 출력되는 log 참조)
			success: printCommDetailAndMembers,
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
});

/* 
 * 요청에 대한 응답 수신 시 호출되는 callback function 
 */
function printCommDetailAndMembers(community) { // community는 JSON data로부터 생성된 JS 객체	  
	 					
	/* 커뮤니티 상세 정보 테이블 생성 */
	$("#commDetail").empty(); 	// commDetail이라는 id를 갖는 엘리먼트의 모든 자식들을 삭제
	$("#commDetail").append("<b>" + community.name + "</b><br>");	// commDetail 엘리먼트에 텍스트 추가
	$("#commDetail").append(document.createElement("table"));	// <table> 엘리먼트 추가
	$("#commDetail table").append("<tr><td>커뮤니티 ID</td><td>"+community.id+"</td></tr>");
	$("#commDetail table").append("<tr><td>이름</td><td>"+community.name+"</td></tr>");
	$("#commDetail table").append("<tr><td>설명</td><td>"+community.description+"</td></tr>");
	$("#commDetail table").append("<tr><td>개설일자</td><td>"+community.startDate+"</td></tr>");
	$("#commDetail table").append("<tr><td>회원수</td><td>"+community.numOfMembers+"</td></tr>");
	var chairId = "";
	if (community.chairId != null) chairId = community.chairId;
	$("#commDetail table").append("<tr><td>회장</td><td>"+chairId+"</td></tr>");				

	// 테이블과 각 열에 style 지정 
	$("#commDetail table").addClass("commTable");	// commDetail 엘리먼트의 자식인 table 엘리먼트에 commTable 클래스 속성 추가 
	$("#commDetail table tr td:first-child").addClass("commHead");	// 각 행의 첫번째 셀에 commHead 클래스 적용
	$("#commDetail table tr td:last-child").addClass("commCell"); // 각 행의 마지막 셀에 commCell 클래스 적용
	$("#commDetail").append("<br>");

	/* 커뮤니티 회원 리스트 테이블 생성 */
	$("#memberList").empty();				
	var members = community.memberList;
	if (members.length > 0) {
		$("#memberList").append("<b>" + community.name + " 회원</b><br>");
		$("#memberList").append(document.createElement("table"));	
		$("#memberList table").addClass("userTable");
		$("#memberList table").append("<tr><th>사용자 ID</th><th>이름</th><th>이메일</th><th>전화번호</th></tr>");
		$("#memberList table tr th").addClass("userHead");
		for (var i = 0; i < members.length; i++) { 
			var mem = members[i];
			$("#memberList table").append(
				"<tr><td>" + mem.userId + "</td>"
				+ "<td>" + mem.name + "</td>"
				+ "<td>" + mem.email + "</td>"
				+ "<td>" + mem.phone + "</td></tr>");
			$("#memberList table tr:last-child td").addClass("userCell"); 
		}						
		$("#memberList").append("<br>");
	}					
}

</script>
</head>
<body>
<br>
<table style="width:100%">
  <tr>
	<td width="20"></td>
	<td>
	  <table>
		<tr>
		  <td class="title">&nbsp;&nbsp;<b>커뮤니티 리스트</b>&nbsp;&nbsp;</td>
		</tr>
	  </table>  
	  <br>		  
	  <table class="commTable">
		<tr>
		  <td class="commHead">이름</td>
		  <td class="commHead">설명</td>
		  <td class="commHead">회원 수</td>
		</tr>
		<c:forEach var="comm" items="${commList}">
			<tr>
			  <td class="commCell">			
				<div><a class="commName" id="${comm.id}" href="#">${comm.name}</a></div>
				<!-- 각 커뮤니티 이름에 class 설정. 클릭 시 위에 정의된 jquery 이벤트 핸들러가 호출됨 -->
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
	  <div id="commDetail"></div>		<!-- 커뮤니티 상세 정보가 출력될 영역 -->
	  
	  <div id="memberList"></div>		<!-- 커뮤니티 회원 리스트가 출력될 영역 -->
	  
	  <a href="<c:url value='/community/create/form' />">커뮤니티 추가</a>
	  <br>
	  <a href="<c:url value='/user/list' />">사용자 목록</a>
	</td>
  </tr>
</table>  
</body>
</html>