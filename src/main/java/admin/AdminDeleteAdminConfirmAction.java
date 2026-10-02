package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import tool.Action;

public class AdminDeleteAdminConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");

        // 一覧画面から送られた値を取得
        String adminAccountCode =
                request.getParameter("adminAccountCode");

        String adminId =
                request.getParameter("adminId");

        // 確認画面へ渡す
        request.setAttribute(
                "adminAccountCode",
                adminAccountCode);

        request.setAttribute(
                "adminId",
                adminId);

        return "admin-delete-adminaccount-check.jsp";
    }
}