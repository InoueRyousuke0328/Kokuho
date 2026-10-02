<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../user/user-header.jsp" %>

<main class="user-home-page">

    <section class="user-home-card">

    <h1 class="user-home-title">
    こんにちは、<span class="user-name"><c:out value="${sessionScope.user.userName}" />さん！</span></h1>

        <p class="user-home-message">
            検索キーワードを入力してください。</p>
        <form action="../user/Media.action"method="post"class="user-keyword-form">
            <input type="text" name="keyword" class="user-keyword-input" placeholder="映画のタイトルを検索">
            <input type="submit" value="検索" class="user-search-button">
        </form>
        
<hr class="user-home-divider">

<form action="../user/Media2.action" method="post" class="user-genre-form">
    <h2 class="user-genre-title">ジャンルを選択してください。 </h2>
    <div class="user-genre-options">
        <label class="user-genre-option">
            <input type="radio" name="genre"value="" checked> 選択なし
        </label>

        <label class="user-genre-option"> <input type="radio" name="genre" value="ANIME"> アニメ </label>
        <label class="user-genre-option"> <input type="radio" name="genre" value="documentary"> ドキュメンタリー </label>
        <label class="user-genre-option"> <input type="radio" name="genre" value="SF"> ＳＦ</label>
        <label class="user-genre-option"> <input type="radio" name="genre" value="horror"> ホラー </label>
        <label class="user-genre-option"> <input type="radio" name="genre" value="etc"> その他 </label>

    </div>
    <input type="submit" value="ジャンル検索" class="user-genre-button">

</form>
    </section>

</main>

<script src="${pageContext.request.contextPath}/js/user-index.js"></script>
<%@ include file="../footer.jsp" %>