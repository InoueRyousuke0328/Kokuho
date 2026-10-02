<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin-header.jsp" %>

<main>
    <h1>更新エラー</h1>

    <img
        src="${pageContext.request.contextPath}/upload/images/${deletedPicture}"
        alt="削除済み作品">
        
        <form action="../admin/admin-index.jsp" method="get">

            <input type="submit" value="管理者トップへ戻る">

        </form>
</main>

<%@ include file="../footer.jsp" %>