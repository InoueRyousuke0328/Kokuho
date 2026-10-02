package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.User;
import DAO.UserDAO;
import tool.Action;

public class UserInsertAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");
        	//userInsertcheck.jspからあたいを受け取りDBへ登録する
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String userName = request.getParameter("userName");

        try {
        	//UserDAOを作り、IDのWチェック
            UserDAO dao = new UserDAO();

            // ID重複
            if (dao.userIdCheck(userId)) {
            	//jspへ値を渡す
                request.setAttribute("userId", userId);
                request.setAttribute("userPassword", userPassword);
                request.setAttribute("userName", userName);
                //重複している場合はエラーページへフォワード
                return "../error/user-insert-check-error.jsp";
            }
            //UserBeanを作り、（空っぽの箱）フォームの情報をまとめる
            User user = new User();
            user.setUserId(userId);
            user.setUserPassword(userPassword);
            user.setUserName(userName);
            //DAOへ渡しDBへ登録する
            int result = dao.userInsert(user);
            //1件登録できたらuserInsertComplete.jsp遷移（完了画面）
            if (result == 1) {
                return "user-insert-complete.jsp";
            }

            // 登録件数が0件だった場合以下内容を保持して、エラー画面へ遷移
            request.setAttribute("userId", userId);
            request.setAttribute("userPassword", userPassword);
            request.setAttribute("userName", userName);

            return "../error/user-insert-error.jsp";
            //tryの中でエラーがあった場合
        } catch (Exception e) {
        	//どんなエラーだったかをコンソールに表示
            e.printStackTrace();
            //入力した値を保持するため（消さないため）
            request.setAttribute("userId", userId);
            request.setAttribute("userPassword", userPassword);
            request.setAttribute("userName", userName);
            //userInsertErrorへ遷移し、userInsert.jspへ値を保持したまま、戻る
            return "../error/user-insert-error.jsp";
        }
    }
}