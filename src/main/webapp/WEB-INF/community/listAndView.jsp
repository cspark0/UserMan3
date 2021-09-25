<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>커뮤니티 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/community.css' />" type="text/css">
<style>
/* 비동기적으로 생성될 테이블들에 대한 스타일 정의 */
.rtable {
  background: YellowGreen;
}
.commHead {		
  width: 120px;
  height: 22px;
  text-align: center;
  background-color: E6ECDE;  
}
.commCell {
  width: 350px;
  text-align: left;
  padding-left: 10px;
  background-color: FFFFFF;  
}
.memHead {
  width: 200px;
  height: 22px;
  text-align: center;
  background-color: E6ECDE;  
}
.memCell {
  width: 200px;
  height: 20px;
  text-align: center;
  background-color: FFFFFF;  
}
</style>
<script src="<c:url value='/js/jquery-1.12.4.min.js'/>" type="text/javascript"></script>
<script type="text/javascript">
/* 
 * 위에서 참조한 jquery 라이브러리를 이용하여, 
 * 커뮤니티 ID 링크를 클릭할 때 새로운 요청(/community/view/json)을 비동기적으로 발생시키고
 * 그 결과(ViewCommunityJsonController가 생성한 JSON 형식의 검색 결과) 객체를 이용하여 
 * 커뮤니티의 상세 정보와 회원 리스트를 커뮤니티 리스트 아래에 각각 테이블로 만들어 출력시킴
 * (DOM tree에 새로운 element들을 추가)
 */
$(document).ready(function() {	
	$(".commName").click(function() { 	// commName 클래스가 지정된 <a> 링크에 대한 이벤트 핸들러
		$.ajax({				// 비동기적인 Ajax request 발생 및 결과 처리
	   		type: "GET",
			url: "<c:url value='/community/view/json'/>"+"?commId="+$(this).attr("id"),
// 					$(this).text(),
			cache: false,
			dataType: "json",	// 결과는 JSON 형식의 data (Console에 출력되는 log 참조)
			success:  function(community) {  // 요청에 대한 응답 수신 시 호출되는 callback function
											 // community는 JSON data로부터 생성된 JS 객체						
				/* 커뮤니티 상세 정보 테이블 생성 */
				$("#commDetail").empty(); 	// commDetail이라는 id를 갖는 엘리먼트의 모든 자식들을 삭제
				$("#commDetail").append(community.name + " 상세 정보:<br>");	// commDetail 엘리먼트에 텍스트 추가
				$("#commDetail").append(document.createElement("table"));	// <table> 엘리먼트 추가
				$("#commDetail table").append("<tr><td>커뮤니티 ID</td><td>"+community.id+"</td></tr>");
				$("#commDetail table").append("<tr><td>이름</td><td>"+community.name+"</td></tr>");
				$("#commDetail table").append("<tr><td>설명</td><td>"+community.description+"</td></tr>");
				$("#commDetail table").append("<tr><td>개설일자</td><td>"+community.startDate+"</td></tr>");
				$("#commDetail table").append("<tr><td>회원수</td><td>"+community.numOfMembers+"</td></tr>");
				var chairId = "";
				if (community.chairId != null) chairId = community.chairId;
				$("#commDetail table").append("<tr><td>회장</td><td>"+chairId+"</td></tr>");				
				var members = community.memberList;
				var memberIds = "";
				for(var i = 0; i < members.length; i++){
				    memberIds = memberIds + members[i].userId + " ";
				}
				$("#commDetail table").append("<tr><td>회원</td><td>"+memberIds+"</td></tr>");
				// 테이블과 각 열에 style 지정 
				$("#commDetail table").addClass("rtable");	// commDetail 엘리먼트의 자식인 table 엘리먼트에 rtable 클래스 속성 추가 
				$("#commDetail table tr td:first-child").addClass("commHead");	// 각 행의 첫번째 셀에 commHead 클래스 적용
				$("#commDetail table tr td:last-child").addClass("commCell");
				$("#commDetail").append("<br>");

				/* 커뮤니티 회원 리스트 테이블 생성 */
				$("#memberList").empty(); 
				if (members.length > 0) {
					$("#memberList").append(community.name + " 회원:<br>");
					$("#memberList").append(document.createElement("table"));	
					$("#memberList table").addClass("rtable");
					$("#memberList table").append("<tr><td>사용자 ID</td><td>이름</td><td>이메일</td><td>커뮤니티</td></tr>");
					$("#memberList table tr td").addClass("memHead");
					for (var i = 0; i < members.length; i++) { 
						var mem = members[i];
						$("#memberList table").append(
							"<tr><td>" + mem.userId + "</td>"
							+ "<td>" + mem.name + "</td>"
							+ "<td>" + mem.email + "</td>"
							+ "<td>" + mem.commId + "</td></tr>");
						$("#memberList table tr:last-child td").addClass("memCell"); 
					}						
					$("#memberList").append("<br>");
				}					
			}
		});
	});	
});
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table style="width:100%">
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
	<td width="20"></td>
	<td>
	  <table>
		<tr>
		  <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>커뮤니티 리스트</b>&nbsp;&nbsp;</td>
		</tr>
	  </table>  
	  <br>		  
	  <table style="background-color: YellowGreen">
		<tr>
		  <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
		  <td width="200" align="center" bgcolor="E6ECDE">이름</td>
		  <td width="200" align="center" bgcolor="E6ECDE">설명</td>
		  <td width="200" align="center" bgcolor="E6ECDE">회원 수</td>
		</tr>
		<c:forEach var="comm" items="${commList}">
			<tr>
			  <td width="200" bgcolor="FFFFFF" style="padding-left: 10" height="20">			
				<a class="commName" id="${comm.id}">${comm.name}</a>  
				<!-- 각 커뮤니티 이름에 class 설정. 클릭 시 위에 정의된 jquery 이벤트 핸들러가 호출됨 -->
			  </td>
			  <td width="300" bgcolor="FFFFFF" style="padding-left: 10">
				  ${comm.description}
			  </td>
			  <td align="center" bgcolor="FFFFFF">
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