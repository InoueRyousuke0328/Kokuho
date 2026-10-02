<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card complete-card">
        <div class="complete-icon">✓</div>
        <h1 class="account-title">レビュー削除完了</h1>
        <p class="complete-message">レビューを削除しました。</p>
        <form action="../review/ReviewList.action"method="post">
            <input type="submit"value="マイページへ戻る"class="account-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>