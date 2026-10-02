<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">
        <h1 class="admin-error-title">ファイル識別エラー</h1>

        <p class="admin-error-message">画像形式のファイルのみアップロード可能です。<br>ファイルの形式を確認してください。</p>

        <form action="../admin/admin-media-update-form.jsp" method="post" class="admin-error-form">
            <input type="submit" value="入力フォームへ戻る" class="admin-error-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>