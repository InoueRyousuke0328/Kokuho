package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Admin;
import DAO.AdminDAO;
import tool.Action;

public class AdminDeleteAction extends Action {

	@Override
	public String execute(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {


		try {
			// 削除確認画面から管理者アカウントコードを受け取る
			int adminAccountCode = Integer.parseInt(
					request.getParameter("adminAccountCode"));


			System.out.println(adminAccountCode); //デバッグ用-------


			AdminDAO dao = new AdminDAO();

			// 削除直前に、対象の管理者アカウントが存在しているか確認する
			Admin admin = dao.adminSearch(adminAccountCode);


			// 対象が存在しない、またはすでに削除されている場合
			if (admin == null) {

				return "../error/admin-delete-adminaccount-error.jsp";
			}


			// 管理者アカウントを削除する
			int result = dao.adminDelete(adminAccountCode);


			// 削除成功
			if (result == 1) {

				request.setAttribute(
						"adminId",
						admin.getAdminId());

				return "admin-delete-adminaccount-complete.jsp";

			}

			return "../error/admin-delete-adminaccount-failure.jsp";


		} catch (Exception e) {
			// DB接続エラー、SQLエラーなどが発生した場合

			System.out.println(e);
			return "../error/admin-delete-adminaccount-failure.jsp";
		}
	}
}