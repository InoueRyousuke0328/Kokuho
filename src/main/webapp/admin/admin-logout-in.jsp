<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-logout-page">
    <section class="admin-logout-card">
        <h1 class="admin-logout-title">ログアウト</h1>
        <p class="admin-logout-message">管理画面をログアウトしますか？</p>
      <form action="AdminLogout.action" method="post" class="admin-logout-form">
    <input type="submit" value="ログアウト" class="admin-logout-button">
</form>
    </section>
</main>

<%@ include file="../footer.jsp" %>