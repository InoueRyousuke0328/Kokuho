<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<main class="admin-media-page">
    <section class="admin-media-card">

        <h1 class="admin-media-title">作品情報新規登録</h1>

        <form action="AdminMediaUpload.action" method="post" enctype="multipart/form-data" class="admin-media-form">

            <div class="admin-media-group">
                <label for="mediaTitle">タイトル</label>
                <input type="text" id="mediaTitle" name="title" value="${param.title }" class="admin-media-input" required pattern=".{1,50}" maxlength="50">
            </div>

            <div class="admin-media-group">
                <label for="mediaInformation">作品情報</label>
                <textarea id="mediaInformation" name="information" rows="10" maxlength="1000" class="admin-media-textarea" required placeholder="1000文字以内で入力してください">${param.information}</textarea>
            </div>

            <fieldset class="admin-media-fieldset">
                <legend>メディアの種類</legend>

                <div class="admin-media-radio-list">
                    <label class="admin-media-radio"><input type="radio" name="type" value="ブルーレイ" ${type=='ブルーレイ'||type==null ? 'checked' : '' }>ブルーレイ</label>
                    <label class="admin-media-radio"><input type="radio" name="type" value="DVD" ${type=='DVD' ? 'checked' : '' }>DVD</label>
                </div>
            </fieldset>

            <fieldset class="admin-media-fieldset">
                <legend>ジャンルを選択してください。</legend>

                <div class="admin-media-radio-list">
                    <label class="admin-media-radio"><input type="radio" name="genre" value="その他" ${genre=='その他'||genre==null ? 'checked' : '' }>その他</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="アクション" ${genre == 'アクション' ? 'checked' : ''}>アクション</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="アニメ" ${genre == 'アニメ' ? 'checked' : ''}>アニメ</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ドキュメンタリー" ${genre=='ドキュメンタリー' ?' checked':'' }>ドキュメンタリー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="SF" ${genre == 'SF' ? 'checked' : ''}>ＳＦ</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ホラー" ${genre == 'ホラー' ? 'checked' : ''}>ホラー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ファンタジー" ${genre == 'ファンタジー' ? 'checked' : ''}>ファンタジー</label>
                    <label class="admin-media-radio"><input type="radio" name="genre" value="ロマンス" ${genre == 'ロマンス' ? 'checked' : ''}>ロマンス</label>
                </div>
            </fieldset>

            <div class="admin-media-group">
                <label for="releaseDate">発売日</label>
                <p class="admin-media-note">※発売日が選択されない場合は公開中として登録されます。</p>
                <input type="date" id="releaseDate" name="releaseDate" value="${releaseDate}" max="9999-12-31" class="admin-media-input admin-media-date">
            </div>

            <div class="admin-media-group">
                <label for="uploadfile">作品画像</label>
                <p class="admin-media-note">アップロードするファイルを選択し、[送信]ボタンを押してください。</p>
                <input type="file" id="uploadfile"  name="uploadfile" class="admin-media-file" accept="image/*" required >
            </div>

            <%-- c:outで太田対策も実装すること（p354） --%>

            <input type="submit" value="送信" class="admin-media-submit">

        </form>
        
   <%-- 管理者トップへ戻る --%>
    <form action="../admin/admin-index.jsp"
          method="post"
          class="admin-register-back-form">

        <input type="submit"
               value="戻る"
               class="admin-media-submit admin-register-back-button">

    </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>