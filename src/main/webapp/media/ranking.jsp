<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="../user/user-header.jsp" %>

<main class="ranking-page">

    <header class="ranking-page-header">



    <h1 class="ranking-page-title">
        映画ランキング
    </h1>

    </header>

    <c:choose>

        <%-- ランキング対象なし --%>
        <c:when test="${empty rankingList}">

            <p class="ranking-empty-message">
                ランキング対象の作品がありません。
            </p>

        </c:when>

        <%-- ランキング表示 --%>
        <c:otherwise>

            <div class="ranking-list">

                <c:forEach
                    var="media"
                    items="${rankingList}"
                    varStatus="status">

                    <%-- 順位ごとのCSSクラスを決める --%>
                    <c:choose>

                        <c:when test="${status.count == 1}">
                            <c:set var="rankClass"
                                   value="ranking-card-first" />
                        </c:when>

                        <c:when test="${status.count == 2}">
                            <c:set var="rankClass"
                                   value="ranking-card-second" />
                        </c:when>

                        <c:when test="${status.count == 3}">
                            <c:set var="rankClass"
                                   value="ranking-card-third" />
                        </c:when>

                        <c:otherwise>
                            <c:set var="rankClass"
                                   value="ranking-card-normal" />
                        </c:otherwise>

                    </c:choose>

                    <article class="ranking-card ${rankClass}">

                        <%-- 順位バッジ --%>
                        <div class="ranking-position">

                            <c:if test="${status.count == 1}">
                                <span class="ranking-crown"
                                      aria-hidden="true">
                                    ♛
                                </span>
                            </c:if>

                            <span class="ranking-position-number">
                                第<c:out value="${status.count}" />位
                            </span>

                        </div>

                        <%-- ポスター --%>
                        <div class="ranking-image-area">

                            <img
                                src="${pageContext.request.contextPath}/upload/images/${media.picture}"
                                class="ranking-image"
                                alt="<c:out value='${media.title}' />">

                        </div>

                        <%-- 作品情報 --%>
                        <div class="ranking-content">

                            <h2 class="ranking-movie-title">
                                <c:out value="${media.title}" />
                            </h2>

                            <%-- 小数に対応した星評価 --%>
<div class="ranking-stars"
     style="--rating-percent: ${media.averageRating * 20}%;"
     aria-label="5点満点中 ${media.averageRating}点">
    ★★★★★
</div>

<div class="ranking-stats">

    <div class="ranking-stat">

        <span class="ranking-stat-label">
            平均評価
        </span>

        <strong class="ranking-average">
            <fmt:formatNumber
                value="${media.averageRating}"
                minFractionDigits="1"
                maxFractionDigits="1" />
        </strong>

    </div>
                                <div class="ranking-stat">

                                    <span class="ranking-stat-label">
                                        レビュー
                                    </span>

                                    <strong class="ranking-review-count">
                                        <c:out value="${media.reviewCount}" />件
                                    </strong>

                                </div>

                            </div>

                            <form action="../review/ReviewGet.action"
                                  method="get"
                                  class="ranking-detail-form">

                                <input type="hidden"
                                       name="mediaCode"
                                       value="${media.mediaCode}">

                                <input type="submit"
                                       value="作品詳細を見る"
                                       class="ranking-detail-button">

                            </form>

                        </div>

                    </article>

                </c:forEach>

            </div>

        </c:otherwise>

    </c:choose>

</main>

<%@ include file="../footer.jsp" %>