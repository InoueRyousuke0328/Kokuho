<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-search-page">
    <section class="admin-review-search-card">

        <h1 class="admin-review-search-title">削除する作品を選択</h1>
        <p class="admin-review-search-message">削除する映画作品のタイトルを入力してください。</p>

        <%-- 作品検索 --%>
        <form action="AdminMediaDelete.action" method="post" class="admin-review-search-form">
            <input type="text" name="title" value="<c:out value='${title}' />" class="admin-review-search-input">
            <input type="submit" value="検索" class="admin-review-search-button">
        </form>

        <div class="admin-review-search-results">
            <c:choose>

                <c:when test="${empty kouho}">
                    <p class="admin-review-search-empty">該当する作品はありません。</p>
                </c:when>

                <c:otherwise>
                    <div class="admin-review-result-heading">
                        <h2>検索結果</h2>
                        <p><c:out value="${kouho.size()}" />件</p>
                    </div>

                    <div class="admin-review-media-list">
                        <c:forEach var="p" items="${kouho}">
                            <div class="admin-review-media-item">
                                <span class="admin-review-media-title"><c:out value="${p.title}" /></span>

                                <form action="AdminMediaDeleteCheck.action" method="post">
                                    <input type="hidden" name="code" value="${p.mediaCode}">
                                    <input type="submit" value="選択" class="admin-review-display-button">
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>

            </c:choose>
        </div>

        <form action="admin-media-delete.jsp" method="post" class="admin-media-select-back-form">
            <input type="submit" value="戻る" class="admin-media-select-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>