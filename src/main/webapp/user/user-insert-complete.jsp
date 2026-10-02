<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card complete-card">
        <h1 class="account-title">会員登録完了</h1>

        <p class="complete-message">会員登録が完了しました。 </p>

        <p class="complete-guide">
        <!-- 文字が二列になる可能性あり。 -->
            ログインして、映画の検索やレビューをお楽しみください。
        </p>
        <form action="${pageContext.request.contextPath}/user/userLogin.jsp"method="post">
            <button type="submit" class="account-button">ログイン画面へ</button>
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>