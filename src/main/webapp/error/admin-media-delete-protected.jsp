<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-login-page">

    <section class="admin-login-card">

        <h1 class="admin-login-title">
            メディア削除エラー
        </h1>

        <p class="admin-confirm-message">
            削除するな。「国宝」をなんだと思ってるんだ
        </p>

        <form action="../admin/admin-index.jsp" method="get" class="admin-error-form">
			<input type="submit"
                   value="管理者メニューへ戻る"
                   class="admin-error-button">
            
        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>