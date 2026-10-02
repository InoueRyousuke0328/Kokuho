<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../admin/admin-header.jsp" %>
<%--@ page import="Bean.Admin"--%>

<%--  
    Admin ado=(Admin)session.getAttribute("admin");
    session.invalidate();
    session = request.getSession();
    session.setAttribute("admin",ado);
    --%>


<main class="admin-menu-page">

    <div class="admin-menu-heading">
        <h1 class="admin-menu-title">管理者メニュー</h1>
        <p class="admin-menu-subtitle">管理機能を選択してください。</p>
    </div>

    <div class="admin-menu-list">
    
    

        <%-- 作品情報新規登録 --%>
        <section class="admin-menu-card">

  <img src="${pageContext.request.contextPath}/icons/admin-icons/media-add.svg"
         class="admin-menu-icon"
         alt="">


            <div class="admin-menu-content">
            <h2>作品情報新規登録</h2>
                <p>新しい作品の情報を登録します。</p>
            </div>

            <a href="admin-media-add.jsp"class="admin-menu-button">登録画面へ</a>
        </section>
        
        
        
        
        
  <%-- 作品情報編集 --%>
<section class="admin-menu-card">
   <img src="${pageContext.request.contextPath}/icons/admin-icons/media-edit.svg" class="admin-menu-icon" alt="">
    <div class="admin-menu-content">
        <h2>作品情報編集</h2>
        <p>登録済みの作品情報を検索して編集します。</p>
    </div>
    <a href="admin-media-update.jsp" class="admin-menu-button">編集画面へ</a>
</section>
        
        
        
        
        <%-- 作品情報削除 --%>
        <section class="admin-menu-card">

<img src="${pageContext.request.contextPath}/icons/admin-icons/media-delete.svg" class="admin-menu-icon" alt="">            
            <div class="admin-menu-content">
                <h2>作品情報削除</h2>
                <p>登録済みの作品情報を削除します。</p>
            </div>
            <a href="admin-media-delete.jsp"class="admin-menu-button">削除画面へ</a>

        </section>

        <%-- 管理者追加登録 --%>
        <section class="admin-menu-card">

<img src="${pageContext.request.contextPath}/icons/admin-icons/admin-add.svg" class="admin-menu-icon" alt="">            
            <div class="admin-menu-content">
                <h2>管理者追加登録</h2>
                <p>新しい管理者アカウントを登録します。</p>
            </div>

            <a href="admin-insert.jsp"class="admin-menu-button">管理者を追加</a>

        </section>
        <%-- アカウント削除 --%>
        <section class="admin-menu-card admin-menu-card-danger">
<img src="${pageContext.request.contextPath}/icons/admin-icons/account-delete.svg" class="admin-menu-icon" alt="">            
            <div class="admin-menu-content">
                <h2>アカウント削除（管理者・利用者）</h2>
                <p>管理者または利用者のアカウントを削除します。</p>
            </div>

            <a href="admin-delete.jsp"class="admin-menu-button admin-danger-button">アカウントを削除</a>
        </section>

        <%-- レビュー削除 --%>
        <section class="admin-menu-card">

<img src="${pageContext.request.contextPath}/icons/admin-icons/review-delete.svg" class="admin-menu-icon" alt="">            
            <div class="admin-menu-content">
                <h2>レビュー削除</h2>
                <p>投稿されたレビューを検索して削除します。</p>
            </div>
            <a href="admin-review-media-search.jsp"
               class="admin-menu-button">
                レビューを削除
            </a>
        </section>
    </div>
</main>
<%@ include file="../footer.jsp" %>