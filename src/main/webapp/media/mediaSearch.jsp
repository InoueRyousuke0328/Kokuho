<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="../user/user-header.jsp" %>

<c:set var="savedKeyword" value="${not empty gingaman ? gingaman : keyword}" />

<main class="user-media-search-page">

    <%-- 検索フォーム --%>
    <section class="user-media-filter-card">

        <form action="../user/Media2.action" method="post" class="user-media-search-form">

            <p class="user-media-search-message">検索キーワードを入力してください。</p>

            <input type="text" name="keyword" value="<c:out value='${savedKeyword}' />" class="user-media-keyword-input" placeholder="映画のタイトルを検索">

            <p class="user-media-genre-title">ジャンルを選択してください。</p>

            <div class="user-media-genre-list">

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="" ${empty genre ? 'checked' : ''}>
                    オールジャンル
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="アクション" ${genre == 'アクション' ? 'checked' : ''}>
                    アクション
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="アニメ" ${genre == 'アニメ' ? 'checked' : ''}>
                    アニメ
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="ドキュメンタリー" ${genre == 'ドキュメンタリー' ? 'checked' : ''}>
                    ドキュメンタリー
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="SF" ${genre == 'SF' ? 'checked' : ''}>
                    SF
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="ホラー" ${genre == 'ホラー' ? 'checked' : ''}>
                    ホラー
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="ファンタジー" ${genre == 'ファンタジー' ? 'checked' : ''}>
                    ファンタジー
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="ロマンス" ${genre == 'ロマンス' ? 'checked' : ''}>
                    ロマンス
                </label>

                <label class="user-media-genre-item">
                    <input type="radio" name="genre" value="その他" ${genre == 'その他' ? 'checked' : ''}>
                    その他
                </label>

            </div>

            <input type="submit" value="検索" class="user-media-search-button">

        </form>

    </section>


    <%-- 検索結果 --%>
    <section class="user-media-results">

        <h1 class="user-media-results-title">
            検索結果 <c:out value="${risu.size()}" />件
        </h1>

        <c:choose>

            <c:when test="${empty risu}">
                <p class="user-media-empty-message">該当する作品はありません。</p>
            </c:when>

            <c:otherwise>

                <%-- ページ設定 --%>
                <c:set var="pageSize" value="15" />
                <c:set var="currentPage" value="${empty param.page ? 1 : param.page}" />

                <fmt:parseNumber var="totalPages" value="${((risu.size() - 1) / pageSize) + 1}" integerOnly="true" />

                <c:if test="${currentPage < 1}">
                    <c:set var="currentPage" value="1" />
                </c:if>

                <c:if test="${currentPage > totalPages}">
                    <c:set var="currentPage" value="${totalPages}" />
                </c:if>

                <c:set var="startIndex" value="${(currentPage - 1) * pageSize}" />
                <c:set var="endDisplay" value="${startIndex + pageSize < risu.size() ? startIndex + pageSize : risu.size()}" />


                <%-- 作品一覧 --%>
                <div class="user-media-result-list">

                    <c:forEach var="media" items="${risu}" begin="${startIndex}" end="${startIndex + pageSize - 1}">

                        <c:url var="detailUrl" value="../review/ReviewGet.action">
                            <c:param name="mediaCode" value="${media.mediaCode}" />
                            <c:param name="keyword" value="${savedKeyword}" />
                            <c:param name="genre" value="${genre}" />
                            <c:param name="page" value="${currentPage}" />
                        </c:url>

                        <a href="${detailUrl}" class="user-media-result-card">

                            <img src="${pageContext.request.contextPath}/upload/images/${media.picture}" class="media-image" alt="<c:out value='${media.title}' />">

                            <div class="user-media-result-content">

                                <h2 class="user-media-result-name">
                                    <c:out value="${media.title}" />
                                </h2>


                                <%-- 平均評価 --%>
                                <div class="user-media-rating">

                                    <c:choose>

                                        <c:when test="${media.reviewCount > 0}">

                                            <span class="user-media-rating-stars" style="--rating-percent: ${media.averageRating * 20}%;" aria-label="5点満点中 ${media.averageRating}点">
                                                ★★★★★
                                            </span>

                                            <span class="user-media-rating-number">
                                                <fmt:formatNumber value="${media.averageRating}" minFractionDigits="1" maxFractionDigits="1" />
                                            </span>

                                            <span class="user-media-review-count">
                                                （<c:out value="${media.reviewCount}" />件）
                                            </span>

                                        </c:when>

                                        <c:otherwise>
                                            <span class="user-media-no-rating">まだ評価はありません</span>
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <p class="user-media-result-label">あらすじ</p>

                                <p class="user-media-result-information">
                                    <c:out value="${media.information}" />
                                </p>

                                <span class="user-media-detail-guide">
                                    作品詳細を見る <span aria-hidden="true">☞</span>
                                </span>

                            </div>

                        </a>

                    </c:forEach>

                </div>


                <%-- ページ切り替え --%>
                <c:if test="${totalPages > 1}">

                    <div class="media-pagination">

                        <p class="media-pagination-info">
                            <c:out value="${startIndex + 1}" />〜<c:out value="${endDisplay}" />件を表示中
                            （全<c:out value="${risu.size()}" />件）
                        </p>

                        <div class="media-pagination-controls">

                            <%-- 最初へ --%>
                            <c:choose>
                                <c:when test="${currentPage <= 1}">
                                    <span class="media-pagination-button is-disabled">≪ 最初へ</span>
                                </c:when>
                                <c:otherwise>
                                    <form action="../user/Media2.action" method="post">
                                        <input type="hidden" name="keyword" value="<c:out value='${savedKeyword}' />">
                                        <input type="hidden" name="genre" value="<c:out value='${genre}' />">
                                        <input type="hidden" name="page" value="1">
                                        <button type="submit" class="media-pagination-button">≪ 最初へ</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>


                            <%-- 前へ --%>
                            <c:choose>
                                <c:when test="${currentPage <= 1}">
                                    <span class="media-pagination-button is-step is-disabled">‹ 前へ</span>
                                </c:when>
                                <c:otherwise>
                                    <form action="../user/Media2.action" method="post">
                                        <input type="hidden" name="keyword" value="<c:out value='${savedKeyword}' />">
                                        <input type="hidden" name="genre" value="<c:out value='${genre}' />">
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <button type="submit" class="media-pagination-button is-step">‹ 前へ</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>


                            <%-- 次へ --%>
                            <c:choose>
                                <c:when test="${currentPage >= totalPages}">
                                    <span class="media-pagination-button is-step is-disabled">次へ ›</span>
                                </c:when>
                                <c:otherwise>
                                    <form action="../user/Media2.action" method="post">
                                        <input type="hidden" name="keyword" value="<c:out value='${savedKeyword}' />">
                                        <input type="hidden" name="genre" value="<c:out value='${genre}' />">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="media-pagination-button is-step">次へ ›</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>


                            <%-- 最後へ --%>
                            <c:choose>
                                <c:when test="${currentPage >= totalPages}">
                                    <span class="media-pagination-button is-disabled">最後へ ≫</span>
                                </c:when>
                                <c:otherwise>
                                    <form action="../user/Media2.action" method="post">
                                        <input type="hidden" name="keyword" value="<c:out value='${savedKeyword}' />">
                                        <input type="hidden" name="genre" value="<c:out value='${genre}' />">
                                        <input type="hidden" name="page" value="${totalPages}">
                                        <button type="submit" class="media-pagination-button">最後へ ≫</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>

                        </div>

                    </div>

                </c:if>

            </c:otherwise>

        </c:choose>

    </section>

</main>

<%@ include file="../footer.jsp" %>