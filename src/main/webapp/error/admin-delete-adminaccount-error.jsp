<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">管理者アカウント削除エラー</h1>

        <p class="admin-error-message">選択された管理者アカウントは、<br>既に削除されています。</p>

        <form action="../admin/admin-delete.jsp" method="post" class="admin-error-form">
            <input type="submit" value="アカウント削除TOPへ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>