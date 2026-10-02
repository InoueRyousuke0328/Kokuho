<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@include file="../user/user-header.jsp" %>

<main class="mypage-page">

    <%-- 会員情報 --%>
    <section class="profile-card">

        <h1 class="mypage-title">
            <c:out value="${sessionScope.user.userName}" /> さんのマイページ
        </h1>

        <p class="profile-id">
            ユーザーID：<c:out value="${sessionScope.user.userId}" />
        </p>

    </section>

    <%-- 投稿したレビュー一覧 --%>
    <section class="review-section">

        <h2 class="review-section-title">投稿したレビュー一覧</h2>

        <c:choose>

            <c:when test="${empty reviewList}">
                <p class="review-empty">投稿したレビューはありません。</p>
            </c:when>

            <c:otherwise>

                <div class="review-list">
                    <c:forEach var="r" items="${reviewList}">
                        <article class="review-card">
                            <div class="review-card-header">
                                <p class="review-title">
                                  タイトル：<c:out value="${r.title}" /></p>
                                <p class="review-date">
                                   投稿日：<fmt:formatDate value="${r.reviewDate}" pattern="yyyy年M月d日" /></p>
                                   
                                  <p class="review-rating">

   					 評価：

   					 <span class="mypage-rating-stars">

       				<span class="mypage-rating-filled"> <c:forEach begin="1" end="${r.rating}">★</c:forEach></span>

       				 <span class="mypage-rating-empty"> <c:if test="${r.rating < 5}"> <c:forEach begin="${r.rating + 1}" end="5">☆</c:forEach>
           		 </c:if>
        		</span>

   				 </span>

				</p>

                            </div>
                            <div class="review-card-body">
                                <h3 class="review-content-title">レビュー内容</h3>
                                <p class="review-content"> <c:out value="${r.review}" /></p>

                            </div>
                            <%-- レビュー削除確認画面へ --%>
                            <form action="ReviewDeleteConfirm.action" method="post" class="review-delete-form">
                                <input type="hidden" name="reviewCode" value="${r.reviewCode}">
                                <input type="submit" value="削除" class="review-delete-button">
                            </form>
                        </article>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
    <%-- 退会ボタン --%>
    <section class="withdrawal-area">

        <form action="../user/user-delete.jsp" method="post" class="withdrawal-form">
            <input type="submit" value="退会する" class="withdrawal-button">
        </form>

    </section>

</main>

<%@include file="../footer.jsp" %>