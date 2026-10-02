<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">レビュー削除エラー</h1>

        <p class="admin-error-message">レビューの削除に失敗しました。<br>時間をおいてから、もう一度操作してください。</p>

        <form action="${pageContext.request.contextPath}/admin/AdminReviewList.action" method="post" class="admin-error-form">
            <input type="hidden" name="mediaCode" value="${mediaCode}">
            <input type="submit" value="レビュー一覧へ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>