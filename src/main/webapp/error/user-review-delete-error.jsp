<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="error-page">

    <section class="error-card">

        <p class="error-message">エラーが発生しました。やり直してください。</p>

        <form action="../review/ReviewList.action"method="get"class="error-form">

            <input type="submit"value="マイページへ戻る"class="error-submit-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>