package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class UserLogoutAction extends Action {
	public String execute
	(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user != null) {
			UserDAO dao = new UserDAO();
			dao.clearUserSessionId(user.getUserId());
			session.invalidate();
			return "userLogout-out.jsp";
		}
		return "login-error.jsp";
	}
}
