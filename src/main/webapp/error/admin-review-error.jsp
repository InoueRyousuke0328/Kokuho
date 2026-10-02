<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">レビュー管理エラー</h1>

        <p class="admin-error-message">エラーが発生しました。<br>検索画面に戻って、もう一度操作してください。</p>

        <form action="../admin/AdminReviewMediaSearch.action" method="post" class="admin-error-form">
            <input type="hidden" name="searchTitle" value="${searchTitle}">
            <input type="submit" value="検索画面へ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>