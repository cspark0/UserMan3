<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="<c:url value='/user/list' />" id="navbardrop" data-toggle="dropdown">
       	사용자 관리(UserMan3b)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<c:url value='/user/list' />">사용자 목록</a>
        <a class="dropdown-item" href="<c:url value='/user/register' />">사용자 추가</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="<c:url value='/community/list' />" id="navbardrop" data-toggle="dropdown">
       	커뮤니티 관리
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<c:url value='/community/list' />">커뮤니티 목록</a>
        <a class="dropdown-item" href="<c:url value='/community/create/form' />">커뮤니티 생성</a>
      </div>
    </li>
    <c:if test="${userId ne null}">
      <li class="nav-item">
	    <a class="nav-link btn-link" href="<c:url value='/user/logout'/>">${userId}(로그아웃)</a>
	  </li>
    </c:if>
  </ul>
</nav>
