<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">パスワード確認エラー</h1>

        <p class="admin-error-message">パスワードと確認用パスワードが一致していません。<br>同じパスワードをもう一度入力してください。</p>

        <form action="../admin/admin-insert.jsp" method="post" class="admin-error-form">
            <input type="hidden" name="adminId" value="${adminId}">
            <button type="submit" class="admin-error-button">登録画面へ戻る</button>
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>