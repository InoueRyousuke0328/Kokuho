<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-list-page">
    <section class="admin-review-list-container">

        <h1 class="admin-review-list-title">レビュー一覧</h1>

        <c:choose>
            <c:when test="${empty reviewList}">
                <div class="admin-review-empty-card">
                    <p>このタイトルにはレビューがありません。</p>
                </div>
            </c:when>

            <c:otherwise>
                <div class="admin-review-list">

                    <c:forEach var="r" items="${reviewList}">
                        <article class="admin-review-card">

                            <div class="admin-review-detail-row">
                                <span class="admin-review-detail-label">タイトル</span>
                                <span class="admin-review-detail-value"><c:out value="${r.title}"/></span>
                            </div>

                            <div class="admin-review-detail-row">
                                <span class="admin-review-detail-label">投稿者</span>
                                <span class="admin-review-detail-value"><c:out value="${r.userName}"/></span>
                            </div>

                            <div class="admin-review-text-area">
                                <p class="admin-review-text-label">レビュー</p>
                                <p class="admin-review-text"><c:out value="${r.review}"/></p>
                            </div>

                            <form action="${pageContext.request.contextPath}/admin/AdminReviewDeleteConfirm.action" method="post" class="admin-review-delete-form">
                                <input type="hidden" name="reviewCode" value="${r.reviewCode}">
                                <input type="hidden" name="userName" value="${r.userName}">
                                <input type="hidden" name="searchTitle" value="<c:out value='${searchTitle}'/>">
                                <input type="hidden" name="mediaList" value="<c:out value='${mediaList}'/>">
                                <input type="submit" value="削除" class="admin-review-delete-button">
                            </form>

                        </article>
                    </c:forEach>

                </div>
            </c:otherwise>
        </c:choose>

        <form action="AdminReviewMediaSearch.action" method="post" class="admin-review-list-back-form">
            <input type="hidden" name="searchTitle" value="<c:out value='${searchTitle}'/>">
            <input type="hidden" name="mediaList" value="<c:out value='${mediaList}'/>">
            <input type="submit" value="検索結果へ戻る" class="admin-review-list-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>