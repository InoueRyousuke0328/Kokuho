<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-login-page">
    <section class="admin-login-card">

        <h1 class="admin-login-title">管理者追加登録</h1>

        <form action="AdminInsertConfirm.action" method="post">

            <div class="admin-form-group">
                <label for="adminId">管理者ID</label>

                <input type="text"
                       id="adminId"
                       name="adminId"
                       value="${param.adminId}"
                       class="admin-login-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{1,10}$"
                       required
                       title="1～10文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">

                <p class="admin-input-note">
                    半角英数字1～10文字<br>
                   大文字・小文字・数字を、それぞれ1文字以上含めてください。
                     </p>
               
            </div>

            <div class="admin-form-group">
                <label for="adminInsertPassword">パスワード</label>

               <input type="password"
       id="adminInsertPassword"
       name="adminPassword"
       value="${param.adminPassword}"
       class="admin-login-input"
       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
       required
       autocomplete="new-password"
       title="8～16文字の半角英数字で、英字と数字をそれぞれ1文字以上含めてください。">

    <label class="admin-password-check">

        <input type="checkbox"
               onchange="
                   document.getElementById('adminInsertPassword').type =
                   this.checked ? 'text' : 'password';
               ">

        パスワードを表示する

    </label>

                <p class="admin-input-note">
                    半角英数字8～16文字<br>
                     大文字・小文字・数字を、それぞれ1文字以上含めてください。
                </p>
                
            </div>

            <%-- 確認用パスワード --%>
            <div class="admin-form-group">
                <label for="adminPasswordConfirm">パスワード確認</label>

                <input type="password"
                       id="adminPasswordConfirm"
                       name="adminPasswordConfirm"
                       class="admin-login-input"
                       pattern="^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,16}$"
                       required
                       autocomplete="new-password"
                       title="確認のため、同じパスワードを入力してください。">

                   <label class="admin-password-check">

        <input type="checkbox"
               onchange="
                   document.getElementById('adminPasswordConfirm').type =
                   this.checked ? 'text' : 'password';
               ">
                    パスワードを表示する
                </label>

                <p class="admin-input-note">
                    確認のため、同じパスワードをもう一度入力してください。
                </p>
            </div>

            <input type="submit"
                   value="確認"
                   class="admin-login-button">
        </form>

        <form action="../admin/admin-index.jsp"
              method="post"
              class="admin-register-back-form">

            <input type="submit"
                   value="戻る"
                   class="admin-login-button admin-register-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>