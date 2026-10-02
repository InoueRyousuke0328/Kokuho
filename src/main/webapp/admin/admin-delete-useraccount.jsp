<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="../admin/admin-header.jsp"%>

<main class="admin-account-list-page">
    <section class="admin-account-list-card">

        <h1 class="admin-account-list-title">
            会員アカウント削除
        </h1>

        <p class="admin-account-list-message">
            削除する会員アカウントを選んでください。
        </p>

        <c:choose>
            <c:when test="${not empty userList}">

                <div class="admin-account-table-wrapper">
                    <table class="admin-account-table">

                        <thead>
                            <tr>
                                <th>会員ID</th>
                                <th>ニックネーム</th>
                                <th>操作</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td>
                                        <c:out value="${user.userId}"/>
                                    </td>

                                    <td>
                                        <c:out value="${user.userName}"/>
                                    </td>

                                    <td class="admin-account-operation">
                                        <form action="AdminDeleteUserConfirm.action" method="post">
                                            <input type="hidden" name="userAccountCode" value="${user.userAccountCode}">
                                            <input type="hidden" name="userId" value="${user.userId}">
                                            <input type="hidden" name="userName" value="${user.userName}">
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
                    削除できる会員アカウントがありません。
                </p>
            </c:otherwise>
        </c:choose>

        <form action="admin-delete.jsp" method="post" class="admin-account-list-back-form">
            <input type="submit" value="戻る" class="admin-account-list-back-button">
        </form>

    </section>
</main>

<%@ include file="../footer.jsp" %>