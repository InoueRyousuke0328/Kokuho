<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-confirm-page">
    <section class="admin-review-confirm-card">

        <h1 class="admin-review-confirm-title">レビュー削除完了</h1>
        <p class="admin-review-confirm-message">レビューを削除しました。</p>

        <form action="AdminReviewList.action" method="post">
            <input type="hidden" name="mediaCode" value="${mediaCode}">
             <input type="hidden" name="searchTitle" value="${searchTitle}">
            <input type="submit" value="レビュー一覧に戻る" class="admin-review-complete-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>