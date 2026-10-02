<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">管理者登録エラー</h1>

        <p class="admin-error-message">管理者登録中にエラーが発生しました。<br>入力内容を確認して、もう一度操作してください。</p>

        <%-- 入力したIDとパスワードを登録画面へ引き継ぐ --%>
        <form action="../admin/admin-insert.jsp" method="post" class="admin-error-form">
            <input type="hidden" name="adminId" value="${adminId}">
            <input type="hidden" name="adminPassword" value="${adminPassword}">
            <input type="submit" value="管理者登録画面へ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>