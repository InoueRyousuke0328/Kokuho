<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card complete-card">

        <div class="complete-icon">✓</div>
        <h1 class="account-title">ログアウト完了</h1>
        <p class="complete-message">会員画面からログアウトしました。</p>
        <p class="complete-guide">ご利用ありがとうございました。</p>
        <form action="../user/index.jsp" method="post" class="complete-top-form">
            <input type="submit" value="ゲストトップへ" class="complete-top-button">
        </form>

    </section>

</main>

<%@include file="../footer.jsp" %>