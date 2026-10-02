<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-login-page">
    <section class="admin-login-card">

        <h1 class="admin-login-title">管理者アカウント登録完了</h1>

        <p class="admin-confirm-message">管理者アカウントを登録しました。</p>

        <form action="admin-insert.jsp" method="post">
            <input type="submit" value="続けて管理者新規登録する" class="admin-login-button">
        </form>
 <form action="admin-index.jsp" method="post" class="admin-register-back-form">

        <input type="submit" value="トップへ戻る" class="admin-login-button admin-register-back-button">
    </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>