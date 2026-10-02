<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../user/user-header.jsp" %>

<main class="account-page">

    <section class="account-card">

        <h1 class="account-title">新規会員登録</h1>

        <form action="UserInsertConfirm.action"method="post"class="account-form">

            <%-- ID入力欄 --%>
            <div class="form-group">

                <label for="userId" class="form-label">会員ID</label>

                <input type="text"id="userId"name="userId"value="${not empty userId ? userId : param.userId}"
                       class="account-input"
                       pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9]{3,10}$"
                       required
                       autocomplete="username"
                       placeholder="IDを入力してください"
                       title="1～10文字の半角英数字で、大文字・小文字・数字をそれぞれ1文字以上含めてください。">

                <small class="form-help">半角英数字1～10文字<br>
                大文字・小文字・数字を、それぞれ1文字以上含めてください。</small>
            </div>

            <%-- パスワード入力欄 --%>
            <div class="form-group">

                <label for="userPassword" class="form-label">パスワード</label>

<div class="password-wrapper">

  <input type="password"
       id="userPassword"
       name="userPassword"
       value="${userPassword}"
       class="account-input"
       pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
       required
       autocomplete="new-password"
       placeholder="パスワードを入力してください"
       title="8～16文字の半角英数字で、大文字・小文字・数字をそれぞれ1文字以上含めてください。">

<label class="password-check">

    <input type="checkbox"onchange="document.getElementById('userPassword').type =this.checked ? 'text' : 'password';">

    パスワードを表示する

</label>

</div>
                <small class="form-help">
                    半角英数字8～16文字<br>
                    大文字・小文字・数字を、それぞれ1文字以上含めてください。
                </small>

            </div>
<%-- パスワード確認入力欄 --%>
<div class="form-group">

    <label for="userPasswordConfirm" class="form-label">
        パスワード確認
    </label>

    <input type="password"
           id="userPasswordConfirm"
           name="userPasswordConfirm"
           value="${userPasswordConfirm}"
           class="account-input"
           pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
           required
           autocomplete="new-password"
           placeholder="もう一度パスワードを入力してください"
           title="確認のため、同じパスワードを入力してください。">
<label class="password-check">

        <input type="checkbox"
               onchange="document.getElementById('userPasswordConfirm').type =
               this.checked ? 'text' : 'password';">

    <small class="form-help">
        確認のため、同じパスワードをもう一度入力してください。
    </small>

</div>            

            <%-- ニックネーム入力欄 --%>
            <div class="form-group">

                <label for="userName" class="form-label">ニックネーム</label>

                <input type="text"id="userName"name="userName"value="${not empty userName ? userName : param.userName}"class="account-input"
                       pattern="[ぁ-んァ-ヶ一-龠a-zA-Z0-9]{1,10}"
                       required
                       placeholder="ニックネームを入力してください"
                       title="ひらがな・カタカナ・漢字・半角英数字で1～10文字入力してください。">

                <small class="form-help"> 1～10文字<br>
                    ひらがな・カタカナ・漢字・半角英数字が使用できます。
                </small>

            </div>

            <button type="submit" class="account-button">
                登録内容を確認
            </button>
        </form>
    </section>
</main>
<script src="${pageContext.request.contextPath}/js/password-toggle.js"></script>
<%@ include file="../footer.jsp" %>