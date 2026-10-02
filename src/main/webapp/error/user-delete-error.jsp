<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="error-page">

    <section class="error-card">

        <h2 class="error-title">会員退会入力エラー</h2>
        <p class="error-message">お手数ですが会員退会画面でもう一度入力をやり直してください。</p>
        <form action="../user/user-delete.jsp"method="post" class="error-form">
            <input type="submit"value="入力画面へ戻る"class="error-submit-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>