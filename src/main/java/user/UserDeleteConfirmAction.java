package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class UserDeleteConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

    	HttpSession session=request.getSession();
    	

        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        // 入力内容を保持
        request.setAttribute("userId", userId);

        /*
         * JSP側でもrequiredを設定しているが、
         * システムを守るためJava側でも未入力を確認する
Dousako3
半角英数字1～10文字
         */
        if (userId == null || userId.isBlank()
                || userPassword == null || userPassword.isBlank()) {

            return "user-delete.jsp";
        }

        UserDAO dao = new UserDAO();

        // IDとパスワードが一致する退会前の会員を検索
        User user = dao.userLogin(userId, userPassword);
        
        User nowuser = (User) session.getAttribute("user");
        // アカウント情報が一致しなかった場合
        if (user == null) {
        	System.out.println("1:");
            return "../error/user-delete-error.jsp";
        }else if(user.getUserId().equals(nowuser.getUserId())) {
        	// 確認画面で使用する会員情報を保持
        	request.setAttribute("user", user);
        	
        	System.out.println(user); //デバッグ用
        	
        	// アカウント情報が一致した場合
        	return "user-delete-check.jsp";
        }

        System.out.println(user.getUserId());
        System.out.println(nowuser.getUserId());
        
        System.out.println("2:");
        
        return "../error/user-delete-error.jsp";
    }
}