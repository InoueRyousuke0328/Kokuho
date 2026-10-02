<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-account-confirm-page">
    <section class="admin-account-confirm-card">

        <h1 class="admin-account-confirm-title">
            会員アカウント削除完了
        </h1>

        <p class="admin-account-confirm-message">
            会員アカウントを削除しました。
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

        <form action="admin-delete.jsp" method="post">
            <input type="submit" value="アカウント削除TOPへ戻る" class="admin-account-next-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>