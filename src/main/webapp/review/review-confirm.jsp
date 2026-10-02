<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../user/user-header.jsp" %>

<main class="review-confirm-page">

    <section class="review-confirm-card">

        <h1 class="review-confirm-title">レビュー確認</h1>
         <p class="review-confirm-message">
            この内容で投稿しますか？
        </p>

        <p class="review-confirm-label">評価</p>

        <div class="review-confirm-rating">
            <c:forEach begin="1" end="${rating}">
                ★
            </c:forEach>

            <c:if test="${rating < 5}">
                <c:forEach begin="${rating + 1}" end="5">
                    ☆
                </c:forEach>
            </c:if>
        </div>

        <p class="review-confirm-label">レビュー内容</p>

        <div class="review-confirm-content"><c:out value="${reviewText}" /></div>

       

        <%-- レビュー登録処理 --%>
        <form action="ReviewInsert.action" method="post">

            <input type="hidden"
                   name="reviewText"
                   value="<c:out value='${reviewText}' />">

            <input type="hidden"
                   name="mediaCode"
                   value="<c:out value='${mediaCode}' />">

            <%-- 評価をReviewInsertActionへ送る --%>
            <input type="hidden"
                   name="rating"
                   value="<c:out value='${rating}' />">

            <input type="hidden"
                   name="keyword"
                   value="<c:out value='${keyword}' />">

            <input type="hidden"
                   name="genre"
                   value="<c:out value='${genre}' />">

            <input type="submit"
                   value="登録"
                   class="review-submit-button">

        </form>

        <%-- レビュー入力画面へ戻る --%>
        <form action="ReviewConfirm.action"
              method="post"
              class="review-back-form">

            <input type="hidden"
                   name="reviewText"
                   value="<c:out value='${reviewText}' />">

            <input type="hidden"
                   name="mediaCode"
                   value="<c:out value='${mediaCode}' />">

            <%-- 選択した評価を保持する --%>
            <input type="hidden"
                   name="rating"
                   value="<c:out value='${rating}' />">

            <input type="hidden"
                   name="keyword"
                   value="<c:out value='${keyword}' />">

            <input type="hidden"
                   name="genre"
                   value="<c:out value='${genre}' />">

            <input type="hidden"
                   name="mode"
                   value="back">

            <input type="submit"
                   value="戻る"
                   class="review-back-button">

        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>