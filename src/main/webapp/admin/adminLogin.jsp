<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-login-page">

    <section class="admin-login-card">

        <h1 class="admin-login-title">管理者ログイン</h1>

        <form action="AdminLogin.action"method="post">
            <div class="admin-form-group">
                <label for="adminId">管理者ID
                </label>
                <input type="text"
                       id="adminId"
                       name="adminId"
                       class="admin-login-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{1,10}$"
                       required
                       title="1～10文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">

                <p class="admin-input-note"> 半角英数字1～10文字<br> 大文字・小文字・数字を、それぞれ1文字以上含めてください。</p>
                
                

            </div>

            <div class="admin-form-group">

                <label for="adminPassword">パスワード</label>

                <input type="password"
                       id="adminPassword"
                       name="adminPassword"
                       class="admin-login-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
                       required
                       title="8～16文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">

                <label class="admin-password-check">
                    <input type="checkbox"onchange="document.getElementById('adminPassword').type =this.checked ? 'text' : 'password';">
                    パスワードを表示する
                </label>
                <p class="admin-input-note">半角英数字8～16文字<br>大文字・小文字・数字を、それぞれ1文字以上含めてください。 </p>

            </div>
            <input type="submit"value="ログイン"class="admin-login-button">
        </form>
    </section>
</main>
<%@ include file="../footer.jsp" %>