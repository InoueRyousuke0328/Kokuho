<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../user/user-header.jsp" %>
<!DOCTYPE html>

<main class="account-page">

    <section class="account-card">

        <h1 class="account-title">パスワード確認エラー</h1>

        <p class="error-message">
            パスワードと確認用パスワードが一致していません。
        </p>

        <p>
            同じパスワードをもう一度入力してください。
        </p>

        <form action="user-insert.jsp" method="post">

            <%-- 入力内容を戻す --%>
            <input type="hidden"
                   name="userId"
                   value="${userId}">

            <input type="hidden"
                   name="userName"
                   value="${userName}">

            <button type="submit" class="account-button">
                新規登録画面へ戻る
            </button>

        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>