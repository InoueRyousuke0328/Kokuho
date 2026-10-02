<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">管理者ID重複エラー</h1>

        <p class="admin-error-message">入力された管理者IDは既に登録されています。<br>別の管理者IDを入力してください。</p>

        <%-- 入力内容は引き継がず、登録画面へ戻る --%>
        <form action="../admin/admin-insert.jsp" method="post" class="admin-error-form">
            <input type="submit" value="管理者登録画面へ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>