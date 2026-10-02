<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../admin/admin-header.jsp" %>
<!DOCTYPE html>

<h2>レビュー管理</h2>

<form action="AdminReviewMediaSearch.action" method="post">

    <p>
        タイトル検索：
        <input type="text"
               name="keyword"
               value="${keyword}">
    </p>

    <input type="submit" value="検索">

</form>

<%@ include file="../footer.jsp" %>

<!-- このjspは何？削除？ watanabe -->