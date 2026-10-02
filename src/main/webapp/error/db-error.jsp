<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 管理者とユーザーでヘッダーを切り替える --%>
<c:choose>
    <c:when test="${not empty sessionScope.admin}">
        <jsp:include page="../admin/admin-header.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="../user/user-header.jsp" />
    </c:otherwise>
</c:choose>

<c:choose>

    <%-- 管理者の場合 --%>
    <c:when test="${not empty sessionScope.admin}">
        <main class="admin-error-page">
            <section class="admin-error-card">
                <h1 class="admin-error-title">データベースエラー</h1>

                <p class="admin-error-message">データベースへの接続中にエラーが発生しました。<br>時間をおいて、もう一度お試しください。</p>

                <form action="../admin/admin-index.jsp" method="post" class="admin-error-form">
                    <input type="submit" value="管理者トップページへ戻る" class="admin-error-button">
                </form>
            </section>
        </main>
    </c:when>

    <%-- 会員・ゲストの場合 --%>
    <c:otherwise>
        <main class="error-page">
            <section class="error-card">
                <h1 class="error-title">データベースエラー</h1>

                <p class="error-message">データベースへの接続中にエラーが発生しました。<br>時間をおいて、もう一度お試しください。</p>

                <form action="../user/index.jsp" method="post" class="error-form">
                    <input type="submit" value="トップページへ戻る" class="error-submit-button">
                </form>
            </section>
        </main>
    </c:otherwise>

</c:choose>

<%@ include file="../footer.jsp" %>