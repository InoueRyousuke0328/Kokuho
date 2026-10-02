<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 投稿日時に秒を表示させないためのコード --%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="../user/user-header.jsp" %>

<main class="review-confirm-page">
    <section class="review-confirm-card">
        <h1 class="review-confirm-title">レビュー削除確認</h1>
        <p class="review-confirm-message">次のレビューを削除しますか？</p>
        <div class="review-delete-details">
            <div class="review-delete-item">
                <h3 class="review-delete-label">タイトル
                </h3>

                <p class="review-delete-value"><c:out value="${review.title}" /></p>
            </div>
            <div class="review-delete-item">
                <h3 class="review-delete-label">投稿日時</h3>
                <p class="review-delete-value"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy/MM/dd" /></p>

            </div>
            <div class="review-delete-item">
                <h3 class="review-delete-label">レビュー内容</h3>

                <p class="review-delete-value review-delete-text"><c:out value="${review.review}" />
                </p>
            </div>
        </div>
        
        <%-- 削除を確定するフォーム --%>
        <form action="ReviewDelete.action"method="post">
            <input type="hidden"name="reviewCode"value="${review.reviewCode}">
            <input type="submit"value="削除"class="review-submit-button">
        </form>
        
        <%-- 削除をキャンセルするフォーム --%>
        <form action="ReviewList.action"method="get"class="review-back-form">
            <input type="submit" value="キャンセル"class="review-back-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>