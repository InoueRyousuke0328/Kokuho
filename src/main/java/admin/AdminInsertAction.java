package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Admin;
import DAO.AdminDAO;
import tool.Action;

public class AdminInsertAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {


        String adminId = request.getParameter("adminId");
        String adminPassword = request.getParameter("adminPassword");

        try {
            AdminDAO dao = new AdminDAO();

            // ID重複
            if (dao.adminIdCheck(adminId)) {

                request.setAttribute("adminId", adminId);
                request.setAttribute("adminPassword", adminPassword);

                return "../error/admin-insert-check-error.jsp";
            }

            Admin admin = new Admin();

            admin.setAdminId(adminId);
            admin.setAdminPassword(adminPassword);

            int result = dao.adminInsert(admin);

            if (result == 1) {
                return "admin-insert-complete.jsp";
            }

            // 登録件数が0件だった場合
            request.setAttribute("adminId", adminId);
            request.setAttribute("adminPassword", adminPassword);

            return "../error/admin-insert-error.jsp";

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("adminId", adminId);
            request.setAttribute("adminPassword", adminPassword);

            return "../error/admin-insert-error.jsp";
        }
    }
}