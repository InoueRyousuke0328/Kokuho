<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">作品削除エラー</h1>

        <p class="admin-error-message">該当する作品が存在しません。<br>検索内容を確認して、もう一度操作してください。</p>

        <form action="../admin/admin-media-delete.jsp" method="post" class="admin-error-form">
            <input type="submit" value="作品削除TOPへ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>