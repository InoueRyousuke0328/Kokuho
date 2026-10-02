package tool;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Admin;
import Bean.User;
import DAO.AdminDAO;
import DAO.UserDAO;

//末尾がactionのURLで呼び出し→/□□/○○.action
@WebServlet(urlPatterns= {"*.action"})
@MultipartConfig(location="")
public class FrontController extends HttpServlet {

	@Override
	public void doPost(
			HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		try {

			// URLの先頭1文字目を削除
			String path = request.getServletPath().substring(1);

			// URLをActionクラス名に変換
			String name = path.replace(".a", "A").replace("/", ".");

			// Actionのインスタンスを生成
			Action action = (Action) Class.forName(name)
					.getDeclaredConstructor()
					.newInstance();

			System.out.println(action);
			System.out.println(action.toString());


			// カウントをクリア
			if (!action.toString().matches("^user.IndexAction.*")) {
				System.out.println("fc count clear");
				session.removeAttribute("count");
			}


			/*
			 * ログイン・ログアウトAction以外は
			 * セッションの有効性を確認する
			 */
			boolean skipVerification =
					name.equals("admin.AdminLoginAction")
					|| name.equals("user.UserLoginAction")
					|| name.equals("admin.AdminLogoutAction")
					|| name.equals("user.UserLogoutAction");


			if (!skipVerification) {

				// 管理者ログイン中の場合
				Admin admin =
						(Admin) session.getAttribute("admin");

				if (admin != null) {

					AdminDAO dao = new AdminDAO();

					if (!dao.adminVerification(admin)) {

						session.invalidate();

						response.sendRedirect("../admin/adimin-index.jsp");
						return;
					}
				}


				// 会員ログイン中の場合
				User user =
						(User) session.getAttribute("user");

				if (user != null) {

					UserDAO dao = new UserDAO();

					if (!dao.userVerification(user)) {

						session.invalidate();

						response.sendRedirect("../user/index.jsp");
						return;
					}
				}
			}


			// Actionのexecuteメソッドを呼び出す
			String url = action.execute(request, response);

			System.out.println(url);
			
			if (url == null) {
			    return;
			}


//			if (url.startsWith("redirect")) {
//
//				url = url.substring(8);
//				response.sendRedirect(url);
//
//			} else {
//
				request.getRequestDispatcher(url)
				.forward(request, response);
//			}


		} catch (SQLException e) {

			e.printStackTrace();
			response.sendRedirect("../error/db-error.jsp");
		}catch(Exception d) {
			//System.out.println("dだよ");デバック用
			if(session.getAttribute("admin")==null) {
				response.sendRedirect("../user/index.jsp");
			}else{
				response.sendRedirect("../admin/admin-index.jsp");
			}
			d.printStackTrace();
		}
	}  

	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		doPost(request,response);

	}
}
