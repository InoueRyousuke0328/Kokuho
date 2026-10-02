<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-account-select-page">
    <section class="admin-account-select-card">

        <h1 class="admin-account-select-title">アカウント削除</h1>

        <p class="admin-account-select-message">
            削除するアカウントの種類を選んでください。
        </p>

        <form action="AdminDeleteAccountSelect.action" method="post">

            <div class="admin-account-type-list">
                <label class="admin-account-type-item">
                    <input type="radio" name="accountType" value="admin" required>
                    <span>管理者アカウント</span>
                </label>

                <label class="admin-account-type-item">
                    <input type="radio" name="accountType" value="user">
                    <span>利用者アカウント</span>
                </label>
            </div>

            <input type="submit" value="次へ" class="admin-account-next-button">
        </form>

        <form action="../admin/admin-index.jsp" method="post" class="admin-account-back-form">
            <input type="submit" value="戻る" class="admin-account-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>