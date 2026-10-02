<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../user/user-header.jsp" %>

<main class="error-page">
    <section class="error-card">
        <h1 class="error-title">レビュー投稿エラー</h1>

        <p class="error-message">この作品には、すでにレビューを投稿しています。</p>

        <form action="../user/Media2.action" method="post" class="error-form">
            <input type="hidden" name="keyword" value="${keyword}">
            <input type="hidden" name="genre" value="${genre}">
            <input type="submit" value="検索結果へ戻る" class="error-submit-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>