<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-delete-page">
    <section class="admin-media-delete-card">

        <h1 class="admin-media-delete-title">作品情報削除完了</h1>

        <p class="admin-media-delete-message">
            作品を削除しました。
        </p>

        <form action="AdminMediaDelete.action" method="post" class="admin-media-delete-form">
        	<!-- keywordからtitleへ変更 watanabe  -->
            <input type="text" name="title" class="admin-media-delete-input"
                   placeholder="削除したい作品のキーワード">
            <input type="submit" value="検索" class="admin-media-delete-button">
        </form>

        <form action="admin-index.jsp" method="post" class="admin-media-select-back-form">
            <input type="submit" value="管理者トップへ戻る" class="admin-media-select-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>