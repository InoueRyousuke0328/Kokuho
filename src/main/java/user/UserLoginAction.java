package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class UserLoginAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");

		// 入力チェック、空欄nullも無効
		if (userId == null || userPassword == null
				|| !userId.matches("[a-zA-Z0-9]{1,10}")
				|| !userPassword.matches("[a-zA-Z0-9]{8,16}")) {
			return "../error/userLogin-error.jsp";
		}

		UserDAO dao = new UserDAO();
		User user = dao.userLogin(userId, userPassword);

		// ログインフォームから送られた情報とDBの情報が一致した時の処理
		if (user != null) {
			// 後からログインした端末を有効にする（遅いもの勝ち）
			request.changeSessionId();
			user.setUserSessionId(session.getId());
			user = dao.userSessionId(user);
			session.setAttribute("user", user);
			return "index.jsp";
		}

		return "../error/userLogin-error.jsp";
	}

}
