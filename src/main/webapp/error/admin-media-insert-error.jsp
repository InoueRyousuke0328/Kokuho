<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">作品登録エラー</h1>

        <p class="admin-error-message">作品情報の登録に失敗しました。<br>入力内容を確認して、もう一度操作してください。</p>

        <form action="../admin/admin-media-add.jsp" method="post" class="admin-error-form">
            <input type="submit" value="作品登録画面へ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>