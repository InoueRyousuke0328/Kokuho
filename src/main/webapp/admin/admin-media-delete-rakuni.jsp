<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-delete-confirm-page">
    <section class="admin-media-delete-confirm-card">

        <h1 class="admin-media-delete-confirm-title">作品情報削除確認</h1>

        <p class="admin-media-delete-confirm-message">
            以下の作品を削除しますか？
        </p>

        <div class="admin-media-delete-confirm-content">
            <div class="admin-media-delete-confirm-row">
                <span class="admin-media-delete-confirm-label">タイトル</span>
                <span class="admin-media-delete-confirm-value">
                    <c:out value="${honmei.title}"/>
                </span>
            </div>

            <div class="admin-media-delete-confirm-row">
                <span class="admin-media-delete-confirm-label">作品情報</span>
                <span class="admin-media-delete-confirm-value">
                    <c:out value="${honmei.information}"/>
                </span>
            </div>
        </div>

        <form action="AdminMediaDeleteSakuzyo.action" method="post">
            <input type="hidden" name="code" value="${honmei.mediaCode}">
            <input type="submit" value="削除" class="admin-media-delete-confirm-button">
        </form>

        <form action="admin-media-delete-kouho.jsp" method="post" class="admin-media-delete-cancel-form">
            <input type="submit" value="キャンセル" class="admin-media-delete-cancel-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>