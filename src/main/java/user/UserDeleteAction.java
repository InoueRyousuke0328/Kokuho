package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class UserDeleteAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // 現在のセッションを取得する
        // セッションが存在しない場合、新しく作成しない
        HttpSession session = request.getSession(false);

        // セッションが存在しない場合
        if (session == null) {
            return "../error/user-delete-failure.jsp";
        }

        // セッションからログイン中の会員情報を取得する
        User user = (User) session.getAttribute("user");

        // ログイン中の会員情報が取得できない場合
        if (user == null) {
        	//セッション削除
            session.invalidate();
            return "../error/user-delete-failure.jsp";
        }

        // ログイン中の会員コードを取得する
        int userAccountCode = user.getUserAccountCode();

        System.out.println(userAccountCode); //デバッグ用
        
        // 会員コードが正しく取得できていない場合
        if (userAccountCode <= 0) {
            session.invalidate();
            return "../error/user-delete-failure.jsp";
        }

        UserDAO dao = new UserDAO();

        // データベースの削除フラグを1へ更新する
        int line = dao.userDelete(userAccountCode);

        // 更新に成功した場合
        if (line > 0) {

            // 退会後はログイン状態を解除する
            session.invalidate();

            return "user-delete-complete.jsp";
        }

        // 更新件数が0件の場合
        // すでに削除済み、または対象会員が存在しない場合
        session.invalidate();

        return "../error/user-delete-failure.jsp";
    }
}