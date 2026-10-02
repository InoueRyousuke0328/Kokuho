package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Admin;
import DAO.AdminDAO;
import tool.Action;

public class AdminLoginAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String adminId = request.getParameter("adminId");
		String adminPassword = request.getParameter("adminPassword");

		// 入力チェック、空欄nullも無効
		if (adminId == null || adminPassword == null
				|| !adminId.matches("[a-zA-Z0-9]{1,10}")
				|| !adminPassword.matches("[a-zA-Z0-9]{8,16}")) {
			return "../error/admin-input-error.jsp";
		}

		AdminDAO dao = new AdminDAO();
		Admin admin = dao.adminLogin(adminId, adminPassword);

		if (admin != null) {
			// 後からログインした端末を有効にする（遅いもの勝ち）
			request.changeSessionId();
			admin.setAdminSessionId(session.getId());
			admin = dao.adminSessionId(admin);
			session.setAttribute("admin", admin);
			return "admin-index.jsp";
		}
		return "../error/adminLogin-error.jsp";
	}

}
