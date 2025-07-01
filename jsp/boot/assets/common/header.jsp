<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/boot/assets/common/menu_bar.css' />">

<div class="menu-bar-wrapper">
  <a href="study_main.jsp" class="menu-card">
    <span class="menu-text">공부</span>
    <img src="<c:url value='/boot/assets/img/icons/study.png' />" class="menu-icon" />
  </a>
  <a href="stats.jsp" class="menu-card">
    <span class="menu-text">통계</span>
    <img src="<c:url value='/boot/assets/img/icons/Calander.png' />" class="menu-icon" />
  </a>
  <a href="post_list.jsp" class="menu-card">
    <span class="menu-text">커뮤니티</span>
    <img src="<c:url value='/boot/assets/img/icons/commu.png' />" class="menu-icon" />
  </a>
  <a href="mypage.jsp" class="menu-card">
    <span class="menu-text">마이페이지</span>
    <img src="<c:url value='/boot/assets/img/icons/profile.png' />" class="menu-icon" />
  </a>
</div>