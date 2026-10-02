<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-update-complete-page">

    <section class="admin-media-update-complete-card">

        <div class="admin-media-update-complete-icon">✓</div>

        <h1 class="admin-media-update-complete-title">作品情報更新完了</h1>
        <p class="admin-media-update-complete-message">作品情報を更新しました。</p>

        <div class="admin-media-update-complete-main">

            <img src="${pageContext.request.contextPath}/upload/images/${mediaInfo.picture}" class="admin-media-update-complete-image" alt="<c:out value='${mediaInfo.title}'/>">

            <div class="admin-media-update-complete-information">

                <h2 class="admin-media-update-complete-name"><c:out value="${mediaInfo.title}"/></h2>

                <div class="admin-media-update-complete-description">
                    <span class="admin-media-update-complete-label">作品詳細</span>
                    <p><c:out value="${mediaInfo.information}"/></p>
                </div>

                <div class="admin-media-update-complete-meta">

                    <div class="admin-media-update-complete-meta-item">
                        <span class="admin-media-update-complete-label">メディアの種類</span>
                        <span><c:out value="${mediaInfo.type}"/></span>
                    </div>

                    <div class="admin-media-update-complete-meta-item">
                        <span class="admin-media-update-complete-label">ジャンル</span>

                     <span>
                     <c:out value="${mediaInfo.genre}"/>
                     <%-- 
                       <c:choose>
                       <c:when test="${mediaInfo.genre == 'anime'}">アニメ</c:when>
                       <c:when test="${mediaInfo.genre == 'documentary'}">ドキュメンタリー</c:when>
                       <c:when test="${mediaInfo.genre == 'sf'}">SF</c:when>
                　     <c:when test="${mediaInfo.genre == 'horror'}">ホラー</c:when>
                       <c:when test="${mediaInfo.genre == 'action'}">アクション</c:when>
                       <c:when test="${mediaInfo.genre == 'etc'}">その他</c:when>
                       <c:otherwise><c:out value="${mediaInfo.genre}"/></c:otherwise>
                       </c:choose>
                     --%>
                       </span>
                    </div>

                    <div class="admin-media-update-complete-meta-item">
                        <span class="admin-media-update-complete-label">発売日</span>
                        <span><c:out value="${mediaInfo.releaseDate}"/></span>
                    </div>

                </div>

            </div>

        </div>

        <div class="admin-media-update-complete-actions">
            <a href="admin-media-update.jsp" class="admin-media-update-continue-button">続けて作品を編集する</a>
            <a href="admin-index.jsp" class="admin-media-update-top-button">管理者トップへ戻る</a>
        </div>

    </section>

</main>

<%@ include file="../footer.jsp" %>