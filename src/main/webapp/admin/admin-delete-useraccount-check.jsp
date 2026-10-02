<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="admin-header.jsp" %>

<main class="admin-account-confirm-page">
    <section class="admin-account-confirm-card">

        <h1 class="admin-account-confirm-title">
            会員アカウント削除確認
        </h1>

        <p class="admin-account-confirm-message">
            以下の会員アカウントを削除します。よろしいですか？
        </p>

        <div class="admin-account-confirm-content">

            <div class="admin-account-confirm-row">
                <span class="admin-account-confirm-label">会員ID</span>
                <span class="admin-account-confirm-value">
                    <c:out value="${userId}"/>
                </span>
            </div>

            <div class="admin-account-confirm-row">
                <span class="admin-account-confirm-label">ニックネーム</span>
                <span class="admin-account-confirm-value">
                    <c:out value="${userName}"/>
                </span>
            </div>

        </div>

        <form action="AdminDeleteUser.action" method="post">
            <input type="hidden" name="userAccountCode" value="${userAccountCode}">
            <input type="submit" value="削除する" class="admin-account-confirm-delete-button">
        </form>

        <form action="AdminDeleteUserConfirm.action" method="post" class="admin-account-confirm-back-form">
            <input type="hidden" name="mode" value="back">
            <input type="submit" value="戻る" class="admin-account-confirm-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>