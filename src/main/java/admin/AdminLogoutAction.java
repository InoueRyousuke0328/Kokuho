package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Admin;
import DAO.AdminDAO;
import tool.Action;

public class AdminLogoutAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("admin");

		if (admin != null) {
			AdminDAO dao = new AdminDAO();
			dao.clearAdminSessionId(admin.getAdminId());
			session.invalidate();
			return "admin-logout-out.jsp";
		}
		return "../error/admin-logout-error.jsp";
	}

}
