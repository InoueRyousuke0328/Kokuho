<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="../user/user-header.jsp" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<main class="media-detail-page">

    <section class="media-detail-card">

        <div class="media-detail-main">

            <img src="${pageContext.request.contextPath}/upload/images/${mediaInfo.picture}" class="media-detail-image" alt="<c:out value='${mediaInfo.title}' />">

            <div class="media-detail-information">

                <h1 class="media-detail-title"><c:out value="${mediaInfo.title}" /></h1>

                <div class="media-detail-description-row">
                    <h2 class="media-detail-description-label">作品紹介</h2>
               <div class="media-detail-description-area">
    <p id="mediaDescription" class="media-detail-description is-collapsed"><c:out value="${mediaInfo.information}" /></p>

<button type="button" id="descriptionToggle" class="media-description-toggle" aria-controls="mediaDescription" aria-expanded="false">もっと見る</button>
</div>
                </div>

                <div class="media-detail-meta">
                
              <%-- 小数に対応した平均評価 --%>
<div class="media-detail-meta-item">

    <span class="media-detail-meta-label">
        平均評価
    </span>

    <span class="media-detail-meta-value media-average-rating">

        <span class="media-average-stars"
              style="--rating-percent: ${mediaInfo.averageRating * 20}%;"
              aria-label="5点満点中 ${mediaInfo.averageRating}点">
            ★★★★★
        </span>

        <span class="media-average-number">
            <fmt:formatNumber
                value="${mediaInfo.averageRating}"
                minFractionDigits="1"
                maxFractionDigits="1" />
        </span>

    </span>

</div>

                    <div class="media-detail-meta-item">
 						 <span class="media-detail-meta-label">ジャンル</span>
    					 <span class="media-detail-meta-value">
        				 <c:out value="${mediaInfo.genre}" />
                            </span>
                     </div>

                    <div class="media-detail-meta-item">
                        <span class="media-detail-meta-label">メディアの種類</span>
                        <span class="media-detail-meta-value"><c:out value="${mediaInfo.type}" /></span>
                    </div>

					<div class="media-detail-meta-item">

    <span class="media-detail-meta-label">発売日</span>

    <span class="media-detail-meta-value">

        <c:choose>

            <%-- 「現在公開中」の場合 --%>
            <c:when test="${mediaInfo.releaseDate eq '現在公開中'}">

                <c:out value="${mediaInfo.releaseDate}" />

            </c:when>

            <%-- 日付の場合 --%>
            <c:otherwise>

                <fmt:parseDate var="date" value="${mediaInfo.releaseDate}" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${date}" pattern="yyyy年MM月dd日" />

            </c:otherwise>

        </c:choose>

    </span>

</div>
</div>

            </div>

        </div>

    </section>

    <section class="media-review-section">

        <h2 class="media-review-title">作品レビュー</h2>

        <c:choose>

            <c:when test="${empty reviewList}">
                <p class="media-review-empty">まだレビューは投稿されていません。</p>
            </c:when>

            <c:otherwise>

                <div class="media-review-list">

                    <c:forEach var="review" items="${reviewList}">

                        <article class="media-review-card">

                            <dl class="media-review-details">

                                <div class="media-review-row">
                                    <dt>ニックネーム</dt>
                                    <dd><c:out value="${review.userName}" /></dd>
                                </div>

                                <div class="media-review-row">
                                    <dt>投稿日</dt>
                                    <dd><fmt:formatDate value="${review.reviewDate}" pattern="yyyy年M月d日" /></dd>
                                </div>
                                
                                <%-- ★追加：投稿された評価 --%>
								<div class="media-review-row">
								    <dt>評価</dt>
								
								    <dd class="media-review-rating">
								
								        <%-- 選択された数だけ★を表示 --%>
								        <c:forEach
								            begin="1"
								            end="${review.rating}">
								            ★
								        </c:forEach>
								
								        <%-- 残りを☆で表示 --%>
								        <c:if test="${review.rating < 5}">
								            <c:forEach
								                begin="${review.rating + 1}"
								                end="5">
								                ☆
								            </c:forEach>
								        </c:if>
								
								    </dd>
								</div>
                                

                                <div class="media-review-row">
                                    <dt>レビュー</dt>
                                    <dd><c:out value="${review.review}" /></dd>
                                </div>

                            </dl>

                        </article>

                    </c:forEach>

                </div>

            </c:otherwise>

        </c:choose>

        <c:if test="${not empty sessionScope.user}">

            <form action="../review/reviewInsert.jsp" method="post" class="media-review-post-form">
                <input type="hidden" name="title" value="<c:out value='${mediaInfo.title}' />">
                <input type="hidden" name="picture" value="${pageContext.request.contextPath}/upload/images/${mediaInfo.picture}">
                <input type="hidden" name="mediaCode" value="${mediaInfo.mediaCode}">
                <input type="hidden" name="information" value="<c:out value='${mediaInfo.information}' />">
                <input type="hidden" name="type" value="${mediaInfo.type}">
                <input type="hidden" name="releaseDate" value="${mediaInfo.releaseDate}">
                <input type="hidden" name="genre" value="<c:out value='${genre}' />">
    			<input type="hidden" name="keyword" value="<c:out value='${keyword}' />">
                <input type="submit" value="投稿する" class="media-review-post-button">
            </form>

        </c:if>

       <form action="../user/Media2.action" method="post" class="media-detail-back-form">
 <%--   <input type="hidden" name="keyword" value="<c:out value='${keyword}' />">
    <input type="hidden" name="genre" value="<c:out value='${genre}' />">--%>
    <input type="submit" value="検索結果へ戻る" class="media-detail-back-button">
</form>

    </section>

</main>

<script src="${pageContext.request.contextPath}/js/media-description.js"></script>
<%@ include file="../footer.jsp" %>
