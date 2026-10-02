<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-page">
    <section class="admin-media-card admin-media-confirm-card">

        <h1 class="admin-media-title">作品情報登録内容確認</h1>
        <p class="admin-media-confirm-message">以下の内容で登録しますか？</p>

        <div class="admin-media-confirm-content">

            <div class="admin-media-preview">
                <img src="${pageContext.request.contextPath}/upload/images/${Media.picture}"
                     class="media-image admin-media-preview-image"
                     alt="${Media.title}">
            </div>

            <div class="admin-media-details">

                <div class="admin-media-detail-row">
                    <span class="admin-media-detail-label">タイトル</span>
                    <span class="admin-media-detail-value">${Media.title}</span>
                </div>

                <div class="admin-media-detail-row">
                    <span class="admin-media-detail-label">作品詳細</span>
                    <span class="admin-media-detail-value admin-media-information">${Media.information}</span>
                </div>

                <div class="admin-media-detail-row">
                    <span class="admin-media-detail-label">メディアの種類</span>
                    <span class="admin-media-detail-value">${Media.type}</span>
                </div>

        		<div class="admin-media-detail-row">
    				<span class="admin-media-detail-label">ジャンル</span>
    				<span class="admin-media-detail-value">${Media.genre}</span>
				</div>

                <div class="admin-media-detail-row">
                    <span class="admin-media-detail-label">発売日</span>
                    <span class="admin-media-detail-value">${Media.releaseDate}</span>
                </div>

            </div>
        </div>

        <form action="AdminMediaInsert.action" method="post">
            <input type="hidden" name="title" value="${Media.title}">
            <input type="hidden" name="information" value="${Media.information}">
            <input type="hidden" name="type" value="${Media.type }">
            <input type="hidden" name="releaseDate" value="${Media.releaseDate}">
            <input type="hidden" name="picture" value="${Media.picture}">
            <input type="hidden" name="genre" value="${Media.genre}">
            <input type="submit" value="確定" class="admin-media-submit">
        </form>

        <form action="AdminMediaAddConfirm.action" method="post" class="admin-media-back-form">
            <input type="hidden" name="title" value="${Media.title}">
            <input type="hidden" name="information" value="${Media.information}">
            <input type="hidden" name="type" value="${Media.type }">
            <input type="hidden" name="releaseDate" value="${Media.releaseDate}">
            <input type="hidden" name="picture" value="${Media.picture}">
            <input type="hidden" name="genre" value="${Media.genre}">
            <input type="hidden" name="mode" value="back">
            <input type="submit" value="修正" class="admin-media-submit admin-media-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>