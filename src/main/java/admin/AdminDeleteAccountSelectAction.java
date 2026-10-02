package admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Admin;
import Bean.User;
import DAO.AdminDAO;
import DAO.UserDAO;
import tool.Action;

public class AdminDeleteAccountSelectAction extends Action {

	@Override
	public String execute(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		//ラジオボタンで選択アカウント種類取得
		String accountType = request.getParameter("accountType");

		// 管理者アカウントが選択された場合
		if ("admin".equals(accountType)) {

			AdminDAO dao = new AdminDAO();
			//削除されていない管理者一覧を取得
			List<Admin> adminList =dao.adminAllSearch();

			request.setAttribute( "adminList", adminList);

			return "admin-delete-adminaccount.jsp";
		}

		// 会員アカウントが選択された場合
		if ("user".equals(accountType)) {

			UserDAO dao = new UserDAO();

			List<User> userList = dao.userAllSearch();

			request.setAttribute("userList",userList);

			return "admin-delete-useraccount.jsp";
		}

		//保険のために念のため
		return "admin-delete.jsp"; 
	}
}