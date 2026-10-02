<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">ログアウトエラー</h1>

        <p class="admin-error-message">すでにログアウトしています。<br>管理者ログイン画面からログインしてください。</p>

        <form action="../admin/adminLogin.jsp" method="post" class="admin-error-form">
            <input type="submit" value="管理者ログインへ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>