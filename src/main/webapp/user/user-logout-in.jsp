<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card logout-card">

        <h1 class="account-title">ログアウト</h1>

        <p class="logout-message">会員画面からログアウトしますか？</p>

        <%-- ログアウト処理へ進む --%>
        <form action="../user/UserLogout.action" method="post" class="account-logout-form">
            <input type="submit" value="ログアウト" class="account-logout-button">
        </form>

        <%-- 会員トップへ戻る --%>
        <form action="../user/index.jsp" method="post" class="account-cancel-form">
            <input type="submit" value="戻る" class="account-cancel-button">
        </form>

    </section>

</main>

<%@include file="../footer.jsp" %>