<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-update-confirm-page">

    <section class="admin-media-update-confirm-card">

        <h1 class="admin-media-update-confirm-title">作品情報編集確認</h1>
        <p class="admin-media-update-confirm-message">以下の内容で作品情報を更新しますか？</p>

        <div class="admin-media-update-confirm-main">

            <%-- 作品画像 --%>
            <img src="${pageContext.request.contextPath}/upload/images/${mediaInfo.picture}" class="admin-media-update-confirm-image" alt="<c:out value='${mediaInfo.title}'/>">

            <%-- 作品情報 --%>
            <div class="admin-media-update-confirm-information">

                <h2 class="admin-media-update-confirm-name"><c:out value="${mediaInfo.title}"/></h2>

                <div class="admin-media-update-confirm-description">
                    <span class="admin-media-update-confirm-label">作品詳細</span>
                    <p><c:out value="${mediaInfo.information}"/></p>
                </div>

                <div class="admin-media-update-confirm-meta">

                    <div class="admin-media-update-confirm-meta-item">
                        <span class="admin-media-update-confirm-label">メディアの種類</span>
                        <span><c:out value="${mediaInfo.type}"/></span>
                    </div>

                    <div class="admin-media-update-confirm-meta-item">
                        <span class="admin-media-update-confirm-label">ジャンル</span>

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

                    <div class="admin-media-update-confirm-meta-item">
                        <span class="admin-media-update-confirm-label">発売日</span>
                        <span><c:out value="${mediaInfo.releaseDate}"/></span>
                    </div>

                </div>

            </div>

        </div>

        <%-- 更新処理 --%>
        <form action="AdminMediaUpdate.action" method="post" class="admin-media-update-confirm-form">
            <%-- セッション属性mediaInfoを使用して更新する --%>
            <input type="submit" value="更新する" class="admin-media-update-confirm-button">
        </form>

        <%-- 検索画面へ戻る --%>
        <form action="admin-media-update.jsp" method="post" class="admin-media-update-back-form">
            <input type="hidden" name="keyword" value="<c:out value='${mediaInfo.title}'/>">
            <input type="submit" value="検索画面へ戻る" class="admin-media-update-back-button">
        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>