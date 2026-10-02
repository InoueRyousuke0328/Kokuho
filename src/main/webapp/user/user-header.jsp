<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<%@ include file="../header.jsp" %>

<link rel="stylesheet"href="${pageContext.request.contextPath}/css/user-style.css">

<header class="site-header">

    <%-- クリックするとトップページに戻るロゴ --%>
   <a href="${pageContext.request.contextPath}/user/Index.action"
   class="site-logo"
   title="トップページへ戻る">

    <span class="logo-text">CinemaDAO</span>

</a>
    <nav class="header-nav">
    
    <!-- ランキングボタン -->
    <a href="${pageContext.request.contextPath}/media/Ranking.action"
   class="ranking-button">

    <span class="ranking-crown" aria-hidden="true">
        <span class="ranking-crown-gem"></span>
    </span>

    <span class="ranking-button-text">映画ランキング</span>
</a>
        <c:choose>
        
            <%-- ログインしていない場合 --%>
<c:when test="${empty sessionScope.user}">
    <a href="${pageContext.request.contextPath}/user/userLogin.jsp" class="login-button">ログイン</a>
    <a href="${pageContext.request.contextPath}/user/user-insert.jsp" class="signup-button">会員登録</a>
</c:when>

            <%-- ログインしている場合 --%>
            <c:otherwise>
    <a href="${pageContext.request.contextPath}/review/ReviewList.action" class="mypage-button">マイページ</a>
    <a href="${pageContext.request.contextPath}/user/user-logout-in.jsp" class="logout-button">ログアウト</a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>