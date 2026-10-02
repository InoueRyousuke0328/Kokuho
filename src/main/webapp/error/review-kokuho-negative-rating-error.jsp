<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../user/user-header.jsp" %>

<main class="kokuho-error-page">

    <section class="kokuho-error-card">

        <%-- 背景装飾 --%>
        <span class="kokuho-decoration kokuho-decoration-left"
              aria-hidden="true"></span>

        <span class="kokuho-decoration kokuho-decoration-right"
              aria-hidden="true"></span>

        <div class="kokuho-error-content">

            <p class="kokuho-error-subtitle">
                CINEMADAO SPECIAL NOTICE
            </p>

            <div class="kokuho-error-icon" aria-hidden="true">
                ★
            </div>

            <%-- CinemaDAOロゴ --%>
            <div class="kokuho-logo-area">

                <span class="kokuho-logo-sparkle sparkle-one"
                      aria-hidden="true">✦</span>

                <span class="kokuho-logo-sparkle sparkle-two"
                      aria-hidden="true">✦</span>

                <span class="kokuho-logo-sparkle sparkle-three"
                      aria-hidden="true">✧</span>

                <span class="kokuho-logo-sparkle sparkle-four"
                      aria-hidden="true">✦</span>

                <span class="kokuho-logo-sparkle sparkle-five"
                      aria-hidden="true">✧</span>

                <img
                    src="${pageContext.request.contextPath}/logo/cinema-dao-logo.png"
                    alt="CinemaDAO"
                    class="kokuho-special-logo">

            </div>

            <h1 class="kokuho-error-title">
                評価エラー
            </h1>

            <p class="kokuho-error-lead">
                なぜ星5評価にしないんだい？
            </p>

            <p class="kokuho-movie-title">
                『国宝』
            </p>

            <div class="kokuho-message-area">

                <p class="kokuho-error-message">
                    『国宝』は素晴らしい映画だよ。
                </p>

                <p class="kokuho-error-message">
                    観た人の心を動かす作品なんだ。<br>
                    評価することを恥ずかしがる必要はないよ。
                </p>

            </div>

            <div class="kokuho-rating-preview"
                 aria-label="星5評価">
                <span>★</span>
                <span>★</span>
                <span>★</span>
                <span>★</span>
                <span>★</span>
            </div>

            <form action="../review/ReviewInsert.action"
                  method="post"
                  class="kokuho-rating-form">

                <input type="hidden"
                       name="reviewText"
                       value="国宝サイコー！">

                <input type="hidden"
                       name="mediaCode"
                       value="<c:out value='${mediaCode}' />">

                <input type="hidden"
                       name="rating"
                       value="5">

                <input type="hidden"
                       name="keyword"
                       value="<c:out value='${keyword}' />">

                <input type="hidden"
                       name="genre"
                       value="<c:out value='${genre}' />">

                <input type="submit"
                       value="評価を★5にして投稿する"
                       class="kokuho-rating-button">

            </form>

            <p class="kokuho-error-note">
                CinemaDAO 国宝審査委員会
            </p>

        </div>

    </section>

</main>

<%@ include file="../footer.jsp" %>