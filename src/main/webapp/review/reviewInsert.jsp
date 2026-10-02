<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../user/user-header.jsp" %>

<c:set var="savedMediaCode"
       value="${not empty param.mediaCode ? param.mediaCode : mediaCode}" />

<c:set var="savedKeyword"
       value="${not empty param.keyword ? param.keyword : keyword}" />

<c:set var="savedGenre"
       value="${not empty param.genre ? param.genre : genre}" />

<%-- 確認画面から戻ったとき、評価を保持する --%>
<c:set var="savedRating"
       value="${not empty param.rating ? param.rating : rating}" />

<main class="review-form-page">

    <section class="review-form-card">

        <h1 class="review-form-title">
            レビュー投稿
        </h1>

        <%-- レビュー確認画面へ --%>
        <form action="ReviewConfirm.action"
              method="post">

            <input type="hidden"
                   name="mediaCode"
                   value="<c:out value='${savedMediaCode}' />">

            <input type="hidden"
                   name="keyword"
                   value="<c:out value='${savedKeyword}' />">

            <input type="hidden"
                   name="genre"
                   value="<c:out value='${savedGenre}' />">

            <%-- 星評価 --%>
            <div class="review-rating-group">

                <label for="reviewRating"
                       class="review-rating-title">
                    評価を選択してください
                </label>

                <select id="reviewRating"
                        name="rating"
                        class="review-rating-select"
                        required>

                    <option value="">
                        評価を選択してください
                    </option>

                    <option value="5"
                        <c:if test="${savedRating == 5}">
                            selected
                        </c:if>>
                        ★★★★★　5点
                    </option>

                    <option value="4"
                        <c:if test="${savedRating == 4}">
                            selected
                        </c:if>>
                        ★★★★☆　4点
                    </option>

                    <option value="3"
                        <c:if test="${savedRating == 3}">
                            selected
                        </c:if>>
                        ★★★☆☆　3点
                    </option>

                    <option value="2"
                        <c:if test="${savedRating == 2}">
                            selected
                        </c:if>>
                        ★★☆☆☆　2点
                    </option>

                    <option value="1"
                        <c:if test="${savedRating == 1}">
                            selected
                        </c:if>>
                        ★☆☆☆☆　1点
                    </option>

                </select>

            </div>

            <%-- レビュー本文 --%>
            <div class="review-text-group">

                <label for="reviewText"
                       class="review-text-title">
                    レビュー内容
                </label>

                <textarea
                    id="reviewText"
                    name="reviewText"
                    rows="8"
                    cols="60"
                    maxlength="500"
                    class="review-textarea"
                    required
                    placeholder="作品の感想を入力してください"><c:out value="${reviewText}" /></textarea>

                <p class="review-text-note">
                    500文字以内で入力してください。
                </p>

            </div>

            <input type="submit"
                   value="確認"
                   class="review-submit-button">

        </form>

        <%-- 作品画面へ戻る --%>
        <form action="../review/ReviewGet.action"
              method="post"
              class="review-back-form">

            <input type="hidden"
                   name="mediaCode"
                   value="<c:out value='${savedMediaCode}' />">

            <input type="hidden"
                   name="keyword"
                   value="<c:out value='${savedKeyword}' />">

            <input type="hidden"
                   name="genre"
                   value="<c:out value='${savedGenre}' />">

            <input type="submit"
                   value="戻る"
                   class="review-back-button">

        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>