package admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class AdminDeleteUserConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String mode = request.getParameter("mode");

        // 確認画面から「戻る」を押した場合
        if ("back".equals(mode)) {

            UserDAO dao = new UserDAO();
            List<User> userList = dao.userAllSearch();

            request.setAttribute("userList", userList);

            return "admin-delete-useraccount.jsp";
        }
        // 一覧画面から「削除」を押した場合
        String userAccountCode =request.getParameter("userAccountCode");

        String userId =request.getParameter("userId");

        String userName =request.getParameter("userName");

        request.setAttribute( "userAccountCode",userAccountCode);
        request.setAttribute("userId",userId);
        request.setAttribute("userName",userName);
        
        
        return "admin-delete-useraccount-check.jsp";
    }
}