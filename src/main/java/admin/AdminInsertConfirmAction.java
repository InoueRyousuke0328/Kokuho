package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import tool.Action;

public class AdminInsertConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {


        String adminId = request.getParameter("adminId");
        String adminPassword = request.getParameter("adminPassword");
        String mode = request.getParameter("mode");
        // 確認用パスワード
        String adminPasswordConfirm = request.getParameter("adminPasswordConfirm");

        // 入力内容を保持
        request.setAttribute("adminId", adminId);
        request.setAttribute("adminPassword", adminPassword);
        AdminDAO dao = new AdminDAO();

        // ID重複
        if (dao.adminIdCheck(adminId)) {

           
            return "../error/admin-insert-check-error.jsp";
        }

        // 「戻る」ボタン
        if ("back".equals(mode)) {
            return "admin-insert.jsp";
        }

        // 未入力チェック
        if (adminId == null || adminId.isBlank()
                || adminPassword == null || adminPassword.isBlank()) {

            return "../error/admin-insert-error.jsp"; 
        }												
        // ID形式チェック
        if (!adminId.matches(
        		"^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d]{1,10}$")) {

            return "../error/admin-insert-error.jsp"; 
        }												

        // パスワード形式チェック
        if (!adminPassword.matches(
        		"^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d]{8,16}$")) {

            return "../error/admin-insert-error.jsp"; 
        }												
        
        //パスワードと再確認パスワードが異なる場合
        if (!adminPassword.equals(adminPasswordConfirm)) {

            return "../error/admin-insert-password-error.jsp";
        }

        // 問題がなければ確認画面へ
        return "admin-insert-check.jsp";
    }
}