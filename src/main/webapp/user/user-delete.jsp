<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card delete-card">
        <h1 class="account-title">会員退会</h1>
        <p class="delete-message">退会する会員IDとパスワードを入力してください。</p>
        <div class="delete-warning">退会すると、アカウント情報を元に戻すことはできません。</div>

        <%-- 退会内容確認フォーム --%>
        <form action="UserDeleteConfirm.action"method="post">
            <div class="form-group">
             <label for="deleteUserId"class="form-label">会員ID</label>

                <input type="text"
                       id="deleteUserId"
                       name="userId"
                       maxlength="10"
                       value="${userId}"
                       class="account-input"
                       required>
				 </div>

            <div class="form-group">
                <label for="deletePassword" class="form-label">パスワード </label>

                <input type="password"
                       id="deletePassword"
                       name="userPassword"
                       maxlength="16"
                       class="account-input"
                       required>
                        <label class="password-check">
                    <input type="checkbox" onchange="document.getElementById('deletePassword').type = this.checked ? 'text' : 'password';">
                    パスワードを表示する
                </label>
            </div>
            <input type="submit"value="退会内容の確認"class="account-button">

        </form>
        <%-- マイページへ戻る --%>
        <form action="../review/ReviewList.action"method="post"class="back-form">
            <input type="submit"value="マイページへ戻る"class="back-button">
        </form>
    </section>
</main>

<%@ include file="../footer.jsp" %>