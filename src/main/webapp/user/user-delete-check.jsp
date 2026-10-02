<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card delete-card">
        <h1 class="account-title">会員退会確認</h1>
        <p class="delete-message">以下のアカウントを退会します。</p>
        <div class="delete-warning">
            <p>退会後はログインできなくなります。</p>
            <p>本当に退会してもよろしいですか？</p>
        </div>
        
        <%-- 退会するアカウント情報 --%>
        <div class="confirm-list">
            <div class="confirm-item">
              <span class="confirm-label">会員ID</span>

                <span class="confirm-value"><c:out value="${user.userId}"/></span>

            </div>
            <div class="confirm-item">
			<span class="confirm-label">ニックネーム</span>

                <span class="confirm-value"><c:out value="${user.userName}"/></span>
            </div>
        </div>

        <%-- 退会処理 --%>
        <form action="UserDelete.action"method="post">
            <input type="submit"value="退会する"class="account-button">
        </form>

        <%-- 会員TOPページへ戻る --%>
        <!-- あえて入力内容保持していません。簡単に退会できると思うなよ。 -->
          <form action="../user/user-delete.jsp"method="post"class="back-form">
            <input type="submit"value="入力へ戻る"class="back-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>