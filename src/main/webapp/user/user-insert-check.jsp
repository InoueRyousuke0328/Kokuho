<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../user/user-header.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%@page import = "Bean.User" %>

<main class="account-page">

    <section class="account-card confirm-card">

        <h1 class="account-title">登録内容確認</h1>

        <p class="confirm-message">
            以下の内容で登録しますか？
        </p>
  <div class="confirm-list">

            <div class="confirm-item">
                <span class="confirm-label">会員ID</span>
                <span class="confirm-value">${userId}</span>
            </div>

            <div class="confirm-item"><span class="confirm-label">パスワード</span>
               <span class="confirm-value password-mask"><c:forEach begin="1" end="${fn:length(userPassword)}">*</c:forEach></span>
            </div>
            <div class="confirm-item">
                <span class="confirm-label">ニックネーム</span>
                <span class="confirm-value">${userName}</span>
            </div>

        </div>

        <%-- 登録処理へ値を送るhiddenは残す --%>
        <form action="UserInsert.action" method="post">

            <input type="hidden" name="userId" value="${userId}">
           <input type="hidden"name="userPassword" value="${userPassword}">
            <input type="hidden" name="userName" value="${userName}">
            <button type="submit" class="account-button">登録</button>
        </form>
 
<form action="UserInsertConfirm.action" method="post" class="back-form">
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="userPassword" value="${userPassword}">
    <input type="hidden" name="userName" value="${userName}">
    <input type="hidden" name="mode" value="back">

   <button type="submit" class="back-button"> 戻る</button>
</form>

   </section>
</main>
<%@ include file="../footer.jsp" %>