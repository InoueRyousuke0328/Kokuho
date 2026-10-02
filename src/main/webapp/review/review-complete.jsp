<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card complete-card">
        <div class="complete-icon">✓</div>
        <p class="complete-message">レビューが投稿されました。</p>

        <form action="../review/ReviewGet.action"method="post">
            <input type="hidden"
                   name="mediaCode"
                   value="${mediaCode}">

            <input type="submit"
                   value="作品詳細画面へ戻る"
                   class="account-button">

        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>