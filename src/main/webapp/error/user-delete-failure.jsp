<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="error-page">

    <section class="error-card">

        <h2 class="error-title">会員退会エラー</h2>
        <p class="error-message">退会処理を完了できませんでした。</p>
        <p class="error-message">ログイン情報が確認できないか、<br>
            アカウント情報の取得に失敗しました。</p>
        <a href="../user/index.jsp"
           class="error-back-button">
            トップページへ戻る
        </a>
    </section>
</main>
<%@ include file="../footer.jsp" %>