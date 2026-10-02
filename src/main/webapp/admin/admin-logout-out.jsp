<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-logout-page">
    <section class="admin-logout-card">
        <h1 class="admin-logout-title">ログアウト完了</h1>
        <p class="admin-logout-message">ログアウトしました。</p>

        <form action="adminLogin.jsp" method="post">
            <input type="submit" value="管理者ログインページへ" class="admin-logout-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>