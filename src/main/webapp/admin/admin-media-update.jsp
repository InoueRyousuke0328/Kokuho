<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-search-page">

    <section class="admin-review-search-card">

        <h1 class="admin-review-search-title">
            作品情報編集
        </h1>

        <p class="admin-review-search-message">
            編集する作品のタイトルを入力してください。
        </p>

        <%-- 作品検索フォーム --%>
        <form action="../user/Media.action"
              method="post"
              class="admin-review-search-form">

            <input type="text"
                   name="keyword"
                   value="<c:out value='${keyword}' />"
                   class="admin-review-search-input"
                   placeholder="作品タイトルを入力">

            <input type="submit"
                   value="検索"
                   class="admin-review-search-button">

        </form>

        <div class="admin-review-search-results">

            <c:choose>

                <%-- まだ検索していない場合 --%>
              <c:when test="${list == null}">
    			<%-- 検索前は何も表示しない --%>
				</c:when>

                <%-- 検索結果が0件の場合 --%>
                <c:when test="${empty list}">

                    <p class="admin-review-search-empty">
                        該当するタイトルはありません。
                    </p>

                </c:when>

                <%-- 検索結果がある場合 --%>
                <c:otherwise>

                    <div class="admin-review-result-heading">

                        <h2>検索結果</h2>

                        <p>
                            <c:out value="${list.size()}" />件
                        </p>

                    </div>

                    <div class="admin-review-media-list">

                        <c:forEach var="media" items="${list}">

                            <div class="admin-review-media-item">

                                <%-- 画像と作品名 --%>
                                <div class="admin-media-update-simple-main">

                                    <img
                                        src="${pageContext.request.contextPath}/upload/images/${media.picture}"
                                        class="admin-media-update-simple-image"
                                        alt="<c:out value='${media.title}' />">

                                    <span class="admin-review-media-title">
                                        <c:out value="${media.title}" />
                                    </span>

                                </div>

                                <%-- 編集画面へ移動 --%>
                                <form action="../admin/AdminMediaGet.action"
                                      method="post">

                                    <input type="hidden"
                                           name="mediaCode"
                                           value="${media.mediaCode}">

                                    <input type="hidden"
                                           name="keyword"
                                           value="<c:out value='${keyword}' />">

                                    <input type="submit"
                                           value="編集する"
                                           class="admin-review-display-button">

                                </form>
 
                            </div>

                        </c:forEach>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    <%-- 管理者トップへ戻る --%>
    <form action="../admin/admin-index.jsp"
          method="post"
          class="admin-register-back-form">

        <input type="submit"
               value="戻る"
               class="admin-login-button admin-register-back-button">

    </form>
    </section>

</main>

<%@ include file="../footer.jsp" %>