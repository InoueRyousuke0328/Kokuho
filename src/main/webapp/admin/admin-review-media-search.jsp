<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-review-search-page">
    <section class="admin-review-search-card">

        <h1 class="admin-review-search-title">
            レビュー削除対象タイトル検索
        </h1>

        <p class="admin-review-search-message">
            レビューを確認する映画作品のタイトルを入力してください。
        </p>

        <form action="AdminReviewMediaSearch.action" method="post" class="admin-review-search-form">
            <input type="text"
                   name="searchTitle"
                   value="<c:out value='${searchTitle}'/>"
                   class="admin-review-search-input">

            <input type="submit"
                   value="検索"
                   class="admin-review-search-button">
        </form>

        <div class="admin-review-search-results">

            <c:choose>
               <c:when test="${empty mediaList}">

   		 <c:if test="${not empty searchTitle}">
       	 <p class="admin-review-search-empty">
            該当するタイトルはありません。
      		  </p>
   			 </c:if>

		</c:when>

                <c:otherwise>

                    <div class="admin-review-result-heading">
                        <h2>検索結果</h2>
                        <p>${mediaList.size()}件</p>
                    </div>

                    <div class="admin-review-media-list">
                        <c:forEach var="media" items="${mediaList}">

                            <div class="admin-review-media-item">

                                <span class="admin-review-media-title">
                                    <c:out value="${media.title}"/>
                                </span>

                                <form action="AdminReviewList.action" method="post">
                                    <input type="hidden" name="mediaCode" value="${media.mediaCode}">

                                    <%-- 検索で入力した文字を引き継ぐ --%>
                                    <input type="hidden"
                                           name="searchTitle"
                                           value="<c:out value='${searchTitle}'/>">
                                           
                                     <input type="hidden" name="mediaList" value="<c:out value='${mediaList}'/>">

                                    <input type="submit"
                                           value="レビュー表示"
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