<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../user/user-header.jsp" %>

<main class="error-page">

    <section class="error-card">

        <p class="error-message">
            空白のみはNG
        </p>

        <p class="error-message">
            記号の「&lt;」および「&gt;」は使えません。
        </p>

        <p class="error-message">
            文字数の上限は５００字まで。
        </p>
        
          <p class="error-message">
            評価は必須です
        </p>        
        <form action="../review/ReviewConfirm.action"method="post" class="error-form">
            <input type="hidden"name="mediaCode"value="<c:out value='${mediaCode}' />">
            <input type="hidden"name="reviewText"value="<c:out value='${reviewText}' />">
            <input type="hidden"name="rating"value="<c:out value='${rating}' />">
            <input type="hidden"name="keyword"value="<c:out value='${keyword}' />">
            <input type="hidden"name="genre"value="<c:out value='${genre}' />">
            <input type="hidden"name="mode" value="back">
            <input type="submit"value="戻る"class="error-submit-button">
        </form>

    </section>

</main>

<%@ include file="../footer.jsp" %>