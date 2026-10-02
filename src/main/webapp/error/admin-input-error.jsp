<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">入力エラー</h1>

        <p class="admin-error-message">管理者IDまたはパスワードの入力が正しくありません。
        <br>
        管理者IDは英数字1～10文字、パスワードは英数字8～16文字で入力してください。</p>

        <form action="../admin/adminLogin.jsp" method="post" class="admin-error-form">
            <input type="submit" value="管理者ログイン" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>