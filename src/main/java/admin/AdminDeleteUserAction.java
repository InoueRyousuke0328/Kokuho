package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class AdminDeleteUserAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {


        try {
             // 削除確認画面から利用者アカウントコードを受け取る
            int userAccountCode = Integer.parseInt( request.getParameter("userAccountCode"));

            UserDAO dao = new UserDAO();

             // 削除直前に、対象の管理者アカウントが存在しているか確認する
            User user = dao.userSearch(userAccountCode);

            // 対象が存在しない、またはすでに削除されている場合
            if (user == null) {
            	 return "../error/admin-delete-useraccount-error.jsp";
            }
            
             // 利用者アカウントを削除する
            int result = dao.userDelete(userAccountCode);
             // 削除成功
            if (result == 1) {

                request.setAttribute( "userId", user.getUserId());
                request.setAttribute("userName", user.getUserName());
                return "admin-delete-useraccount-complete.jsp";
            }
             //削除処理に失敗した場合
            return "../error/admin-delete-useraccount-failure.jsp";

        } catch (Exception e) {
             // DB接続エラー、SQLエラーなどが発生した場合
        	  return "../error/admin-delete-useraccount-failure.jsp";
        }
    }
}