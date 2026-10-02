<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../user/user-header.jsp" %>
<%--@ page import="Bean.User" --%>
<%--invalidateはうまくいかなかったのでfilterでやる(アノテーションとxmlの二重指定を解除してもうまくいかなかった--%>
<%--  session=request.getSession();
    User us=(User)session.getAttribute("user");
    if(us==null){
    	session.invalidate();
    	session=request.getSession();
    	session.setAttribute("user", us);
    	System.out.println(session.getAttribute("user"));
    }else{
    session.invalidate();
    session= request.getSession();
    session.setAttribute("user",us);
    System.out.println(session.getAttribute("user"));
    }
--%>


<main class="user-home-page">

    <section class="user-home-card">

        <%-- ログイン状態によって見出しを切り替える --%>
       <c:choose>

    <c:when test="${not empty sessionScope.user}">
        <h1 class="user-home-title">
            こんにちは、
            <span class="user-name">
                <c:out value="${sessionScope.user.userName}" />さん！
            </span>
        </h1>

        <p class="user-home-guide">
            映画を検索して、レビューを楽しみましょう。
        </p>
    </c:when>

    <c:otherwise>
        <h1 class="user-home-title">
            CinemaDAOのTOPページにようこそ！
        </h1>
    </c:otherwise>

</c:choose>
        <%-- キーワードとジャンルの一括検索 --%>
        <form action="../user/Media2.action"
              method="post"
              class="user-search-form">

            <p class="user-home-message">
                検索キーワードを入力してください。
            </p>

            <input type="text"
                   name="keyword"
                   class="user-keyword-input"
                   placeholder="映画のタイトルを検索"
                   value="${keyword}">

            <div class="user-genre-section">

                <p class="user-genre-title"> ジャンルを選択してください。</p>

                <div class="user-genre-list">
                <label class="user-genre-item">
                <input type="radio" name="genre" value=""
                 ${empty genre ? 'checked' : ''}>オールジャンル</label>
                 
                    
                  <label class="user-genre-item"> 
                  <input type="radio" name="genre" value="アクション"
                  ${genre == 'アクション' ? 'checked' : ''}> アクション 
                  </label>
                  
                  <label class="user-genre-item"> 
                  <input type="radio" name="genre" value="アニメ"
                  ${genre == 'アニメ' ? 'checked' : ''}> アニメ 
                  </label>

                   <label class="user-genre-item">
                   <input type="radio" name="genre" value="ドキュメンタリー" 
                   ${genre == 'ドキュメンタリー' ? 'checked' : ''}>ドキュメンタリー
                   </label>

                    <label class="user-genre-item">
                    <input type="radio" name="genre" value="SF"
                     ${genre == 'SF' ? 'checked' : ''}> SF
                    </label>

                    <label class="user-genre-item">
                     <input type="radio" name="genre" value="ホラー"
                       ${genre == 'ホラー' ? 'checked' : ''}>ホラー
                    </label>
                    
                    <label class="user-genre-item">
                     <input type="radio" name="genre" value="ファンタジー"
                       ${genre == 'ファンタジー' ? 'checked' : ''}>ファンタジー
                    </label>
                    
                    <label class="user-genre-item">
                     <input type="radio" name="genre" value="ロマンス"
                       ${genre == 'ロマンス' ? 'checked' : ''}>ロマンス
                    </label>

                    <label class="user-genre-item">
                    <input type="radio" name="genre" value="その他"
                     ${genre == 'その他' ? 'checked' : ''}>その他
                    </label>

                </div>
            </div>
               <%-- キーワードとジャンルをまとめて検索 --%>
    <input type="submit"
           value="検索"
           class="user-search-button">

</form>
    </section>
</main>

<%-- 隠しボタンのCSS --%>
<style>
.secret-button {
    position: fixed;
    right: 10px;
    bottom: 10px;
    width: 30px;
    height: 30px;
    background: transparent;
    border: none;
    opacity: 0;
    cursor: pointer;
}
</style>

<%-- 隠しボタン --%>
<form action="../secret/Secret.action" method="post">
    <button type="submit"
            class="secret-button"
            aria-label="シークレット">
    </button>
</form>

<%-- 名前の下線を動かすJavaScript --%>
<script src="${pageContext.request.contextPath}/js/user-index.js"></script>

<%@ include file="../footer.jsp" %>