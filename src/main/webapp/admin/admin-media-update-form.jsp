<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-media-page">

    <section class="admin-media-card">

        <h1 class="admin-media-title">作品情報編集</h1>
        <p class="admin-media-guide">登録されている作品情報を編集してください。</p>

        <form action="AdminMediaReUpload.action" method="post" enctype="multipart/form-data" class="admin-media-form">

            <%-- タイトル --%>
            <div class="admin-media-group">
                <label for="mediaTitle">タイトル</label>
                <input type="text" id="mediaTitle" name="title" value="<c:out value='${mediaInfo.title}'/>" class="admin-media-input" required pattern=".{1,50}" maxlength="50">
            </div>

            <%-- 作品情報 --%>
            <div class="admin-media-group">
                <label for="mediaInformation">作品情報</label>
                <textarea id="mediaInformation" name="information" rows="10" maxlength="1000" class="admin-media-textarea" required placeholder="1000文字以内で入力してください"><c:out value="${mediaInfo.information}"/></textarea>
            </div>

            <%-- メディアの種類 --%>
            <fieldset class="admin-media-fieldset">
                <legend>メディアの種類</legend>

                <div class="admin-media-radio-list">
                    <label class="admin-media-radio"><input type="radio" name="type" value="ブルーレイ" ${mediaInfo.type == 'ブルーレイ' ? 'checked' : ''}>ブルーレイ</label>
                    <label class="admin-media-radio"><input type="radio" name="type" value="DVD" ${mediaInfo.type == 'DVD' ? 'checked' : ''}>DVD</label>
                </div>
            </fieldset>

            <%-- ジャンル --%>
            <fieldset class="admin-media-fieldset">
                <legend>ジャンル</legend>

                <div class="admin-media-radio-list">
                    <label class="admin-media-radio"><input type="radio" name="genre" value="その他" ${empty mediaInfo.genre || mediaInfo.genre == 'その他' ? 'checked' : ''}>その他</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="アニメ" ${mediaInfo.genre == 'アニメ' ? 'checked' : ''}>アニメ</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ドキュメンタリー" ${mediaInfo.genre == 'ドキュメンタリー' ? 'checked' : ''}>ドキュメンタリー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="SF" ${mediaInfo.genre == 'SF' ? 'checked' : ''}>SF</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ホラー" ${mediaInfo.genre == 'ホラー' ? 'checked' : ''}>ホラー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="アクション" ${mediaInfo.genre == 'アクション' ? 'checked' : ''}>アクション</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ファンタジー" ${mediaInfo.genre == 'ファンタジー' ? 'checked' : ''}>ファンタジー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ロマンス" ${mediaInfo.genre == 'ロマンス' ? 'checked' : ''}>ロマンス</label>
                </div>
            </fieldset>

            <%-- 発売日 --%>
            <div class="admin-media-group">
                <label for="releaseDate">発売日</label>
               <p class="admin-media-note">※発売日が選択されない場合は公開中として登録されます。</p>
                <input type="date" id="releaseDate" name="releaseDate" value="${mediaInfo.releaseDate}" max="9999-12-31" class="admin-media-input admin-media-date">
            </div>

            <%-- 現在の画像 --%>
            <div class="admin-media-group">
                <span class="admin-media-current-label">現在の作品画像</span>
                <img src="${pageContext.request.contextPath}/upload/images/${mediaInfo.picture}" class="admin-media-current-image" alt="<c:out value='${mediaInfo.title}'/>">
            </div>

            <%-- 新しい画像 --%>
            <div class="admin-media-group">
                <label for="uploadfile">変更後の作品画像</label>
                <p class="admin-media-note">アップロードする画像ファイルを選択してください(選択しない場合は現在の作品画像が適用されます)。</p>
                <input type="file" id="uploadfile" name="uploadfile" class="admin-media-file" accept="image/*">
            </div>

            <%-- c:outで太田対策も実装すること（p354） --%>

            <input type="submit" value="送信" class="admin-media-submit">

        </form>
<form action="../user/Media.action"
      method="post"
      class="admin-register-back-form">

    <input type="hidden"
           name="keyword"
           value="<c:out value='${keyword}' />">

    <input type="submit"
           value="戻る"
           class="admin-media-submit admin-register-back-button">

</form>
    </section>

</main>

<%@ include file="../footer.jsp" %>