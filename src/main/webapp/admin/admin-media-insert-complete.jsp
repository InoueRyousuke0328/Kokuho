<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-page">
    <section class="admin-media-card admin-media-confirm-card">

        <h1 class="admin-media-title">登録に成功しました</h1>

        <div class="admin-media-confirm-content">

            <div class="admin-media-preview">
                <img src="${pageContext.request.contextPath}/upload/images/${Media.picture}" class="media-image admin-media-preview-image" alt="${Media.title}">
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

        <form action="admin-media-add.jsp" method="post">
            <input type="submit" value="続けて登録" class="admin-media-submit">
        </form>

        <form action="admin-index.jsp" method="post" class="admin-media-back-form">
            <input type="submit" value="トップページへ" class="admin-media-submit admin-media-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>