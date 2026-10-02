<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../admin/admin-header.jsp" %>

<main class="admin-account-list-page">
    <section class="admin-account-list-card">

        <h1 class="admin-account-list-title">管理者アカウント削除</h1>

        <p class="admin-account-list-message">
            削除する管理者アカウントを選んでください。
        </p>

        <c:choose>
            <c:when test="${not empty adminList}">

                <div class="admin-account-table-wrapper">
                    <table class="admin-account-table">
                        <thead>
                            <tr>
                                <th>管理者ID</th>
                                <th>操作</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="admin" items="${adminList}">
                                <tr>
                                    <td>
                                        <c:out value="${admin.adminId}"/>
                                    </td>

                                    <td class="admin-account-operation">
                                        <form action="AdminDeleteAdminConfirm.action" method="post">
                                            <input type="hidden" name="adminId" value="${admin.adminId}">
                                            <input type="hidden" name="adminAccountCode" value="${admin.adminAccountCode}">
                                            <input type="submit" value="削除" class="admin-account-delete-button">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </c:when>

            <c:otherwise>
                <p class="admin-account-empty-message">
                    削除できる管理者アカウントがありません。
                </p>
            </c:otherwise>
        </c:choose>

        <form action="admin-delete.jsp" method="post" class="admin-account-list-back-form">
            <input type="submit" value="戻る" class="admin-account-list-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>