<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../user/user-header.jsp" %>

<main class="user-login-page">

    <section class="user-login-card">

        <h1 class="user-login-title">
            評価エラー
        </h1>

        <p class="user-confirm-message">
            評価は★1～★5の中から選択してください。
        </p>

        <form action="../review/reviewInsert.jsp" method="post">

            <input type="hidden"
                   name="reviewText"
                   value="${reviewText}">

            <input type="hidden"
                   name="mediaCode"
                   value="${mediaCode}">

            <input type="hidden"
                   name="keyword"
                   value="${keyword}">

            <input type="hidden"
                   name="genre"
                   value="${genre}">

            <input type="submit"
                   value="投稿画面へ戻る"
                   class="button">

        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>