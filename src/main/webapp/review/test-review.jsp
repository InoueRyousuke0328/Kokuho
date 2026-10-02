<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../user/user-header.jsp"%>

<%-- メディア検索が完成したら消す --%>
<h2>レビュー対象のメディアコードを入力</h2>
<form action="reviewInsert.jsp" method="post">
    <input type="text" name="mediaCode" >
    <input type="submit" value="確認">
</form>
<%@ include file="../footer.jsp" %>