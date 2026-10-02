<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-error-page">
    <section class="admin-error-card">

        <h1 class="admin-error-title">
            メディア登録エラー
        </h1>

        <p class="admin-error-message">
            同じタイトルの作品はすでに登録されています。<br>
            別のタイトルを入力してください。
        </p>

        <form action="../admin/admin-index.jsp"
      method="get"
      class="admin-error-form">

            <input type="submit"
                   value="管理者トップへ戻る"
                   class="admin-error-button">

        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>