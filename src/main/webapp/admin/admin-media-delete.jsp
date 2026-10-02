<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-delete-page">
    <section class="admin-media-delete-card">

        <h1 class="admin-media-delete-title">作品情報削除</h1>

        <p class="admin-media-delete-message">
            削除したい作品のキーワードを入力してください。
        </p>

        <form action="AdminMediaDelete.action" method="post" class="admin-media-delete-form">
            <input type="text" name="title" value="${shinenote}" class="admin-media-delete-input">
            <input type="submit" value="検索" class="admin-media-delete-button">
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