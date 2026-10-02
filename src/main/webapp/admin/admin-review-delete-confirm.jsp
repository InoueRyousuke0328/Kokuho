<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-confirm-page">
    <section class="admin-review-confirm-card">

        <h1 class="admin-review-confirm-title">レビュー削除確認</h1>
        <p class="admin-review-confirm-message">以下のレビューを削除しますか？</p>

        <div class="admin-review-confirm-content">
            <div class="admin-review-confirm-row">
                <span class="admin-review-confirm-label">タイトル</span>
                <span class="admin-review-confirm-value"><c:out value="${review.title}"/></span>
            </div>

            <div class="admin-review-confirm-row">
                <span class="admin-review-confirm-label">投稿者</span>
                <span class="admin-review-confirm-value"><c:out value="${userName}"/></span>
            </div>

            <div class="admin-review-confirm-review">
                <p class="admin-review-confirm-label">レビュー内容</p>
                <p class="admin-review-confirm-text"><c:out value="${review.review}"/></p>
            </div>
        </div>

        <form action="AdminReviewDelete.action" method="post">
            <input type="hidden" name="reviewCode" value="${review.reviewCode}">
            <input type="hidden" name="mediaCode" value="${review.mediaCode}">
            <input type="hidden" name="userName" value="${userName}">
             <input type="hidden" name="searchTitle" value="${searchTitle}">
            <input type="submit" value="削除する" class="admin-review-confirm-delete-button">
        </form>

        <form action="AdminReviewList.action" method="post" class="admin-review-confirm-back-form">
            <input type="hidden" name="mediaCode" value="${review.mediaCode}">
            <input type="hidden" name="searchTitle" value="${searchTitle}">
            <input type="hidden" name="mediaList" value="${mediaList}">
            <input type="submit" value="戻る" class="admin-review-confirm-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>