<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-login-page">
    <section class="admin-login-card">

        <h1 class="admin-login-title">管理者登録内容確認</h1>
        <p class="admin-confirm-message">以下の内容で登録しますか？</p>

        <div class="admin-confirm-list">

            <div class="admin-confirm-row">
                <span class="admin-confirm-label">管理者ID</span>
                <span class="admin-confirm-value"><c:out value="${adminId}" /></span>
            </div>

            <div class="admin-confirm-row">
                <span class="admin-confirm-label">パスワード</span>
                <span class="admin-confirm-value"><c:forEach begin="1"
               end="${fn:length(adminPassword)}">*</c:forEach>
               </span>
               
            </div>

        </div>

        <form action="AdminInsert.action" method="post">
            <input type="hidden" name="adminId" value="${adminId}">
            <input type="hidden" name="adminPassword" value="${adminPassword}">
            <input type="submit" value="登録" class="admin-login-button">
        </form>

        <form action="AdminInsertConfirm.action" method="post" class="admin-register-back-form">
            <input type="hidden" name="adminId" value="${adminId}">
            <input type="hidden" name="adminPassword" value="${adminPassword}">
            <input type="hidden" name="mode" value="back">
            <input type="submit" value="戻る" class="admin-login-button admin-register-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>