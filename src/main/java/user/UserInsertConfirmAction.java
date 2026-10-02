package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import tool.Action;

public class UserInsertConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        

        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        //確認用パスワードを取得
        String userPasswordConfirm = request.getParameter("userPasswordConfirm");
        String userName = request.getParameter("userName");
        String mode = request.getParameter("mode");
        UserDAO dao=new UserDAO();
        if (dao.userIdCheck(userId)) {
        	request.setAttribute("userId", userId);
            request.setAttribute("userPassword", userPassword);
            request.setAttribute("userName", userName);
        	return "../error/user-insert-check-error.jsp";
        }
        

        // 入力内容を保持
        //確認用パスワードはセキュリティ上、保持せず、もう一度入力させる
        request.setAttribute("userId", userId);
        request.setAttribute("userPassword", userPassword);
        request.setAttribute("userName", userName);

        // userInsertCheck.jspからuserInsert.jspへ戻るボタンを押した場合
        //入力内容を保持したまま戻ることができる
        if ("back".equals(mode)) {
            return "user-insert.jsp";
        }

        // userID,userPassword,userNameが未入力だった場合userInsert.jspへ戻る
        //太田対策：システムを守るため、入力の二重チェック
        if (userId == null || userId.isBlank()
                || userPassword == null || userPassword.isBlank()
                || userName == null || userName.isBlank()
                || userPasswordConfirm.isBlank()) {

            return "user-insert.jsp";
        }
        
        //パスワードが一致しているかチェック
        if (!userPassword.equals(userPasswordConfirm)) {

            request.setAttribute("userId", userId);
            request.setAttribute("userName", userName);

            return "../error/user-insert-password-error.jsp";
        }
        
        // ID形式チェック
        if (!userId.matches(
        		"^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d]{1,10}$")) {

            return "user-insert.jsp";
        }

        // パスワード形式チェック
        if (!userPassword.matches(
        		"^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d]{8,16}$")) {

            return "user-insert.jsp";
        }

        // ニックネーム形式チェック
        if (!userName.matches(
                "[ぁ-んァ-ヶ一-龠a-zA-Z0-9]{1,10}")) {

            return "user-insert.jsp";
        }

        // 問題がなければ確認画面へ
        return "user-insert-check.jsp";
    }
}
