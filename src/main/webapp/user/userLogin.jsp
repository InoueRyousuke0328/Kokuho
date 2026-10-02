<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../user/user-header.jsp" %>


<main class="account-page">

    <section class="account-card login-card">
        <h1 class="account-title">ログイン</h1>
        <form action="UserLogin.action" method="post">
            <div class="form-group">
                <label class="form-label">会員ID</label>

                <input type="text"
                       name="userId"
                       class="account-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{1,10}$"
                       required
                       title="1～10文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">
<small class="form-help">
            半角英数字1～10文字<br>
            英字と数字を、それぞれ1文字以上含めてください。
        </small>
            </div>

            <div class="form-group">
                <label class="form-label">パスワード</label>

                <input type="password"
                		id="loginPassword"
                       name="userPassword"
                       class="account-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
                       required
                       title="8～16文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">
 <label class="password-check">

            <input type="checkbox"onchange="document.getElementById('loginPassword').type =this.checked ? 'text' : 'password'; ">
            パスワードを表示する
        </label>

        <small class="form-help">
            半角英数字8～16文字<br>
            英字と数字を、それぞれ1文字以上含めてください。
        </small>

            </div>

            <p><input type="submit"value="ログイン"class="account-button"></p>
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>