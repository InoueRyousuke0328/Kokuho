<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../header.jsp" %>

<%-- 管理者用CSSを読み込む --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-account.css?v=2">

<header class="admin-site-header">

    <a href="../admin/admin-index.jsp" class="admin-logo" title="管理者トップへ戻る">
        <span class="admin-logo-name">CinemaDAO</span>
        <span class="admin-logo-badge">Admin</span>
    </a>

    <nav class="admin-header-nav">
        <c:choose>

            <c:when test="${empty sessionScope.admin}">
                <a href="../admin/adminLogin.jsp" class="admin-login-link">ログイン</a>
            </c:when>

            <c:otherwise>
                <a href="../admin/admin-index.jsp">トップ</a>
                <a href="../admin/admin-logout-in.jsp">ログアウト</a>
            </c:otherwise>

        </c:choose>
    </nav>

</header>