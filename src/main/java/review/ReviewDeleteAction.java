package review;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewDeleteAction extends Action{

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();

        User user =
            (User)session.getAttribute("user");

        if(user == null){
            return "../error/user-review-delete-error.jsp";
        }

        int reviewCode =
            Integer.parseInt(
                request.getParameter("reviewCode"));

        ReviewDAO dao =
            new ReviewDAO();

        int result =
            dao.reviewDelete(reviewCode,
                    user.getUserAccountCode());

        if(result > 0){
            return "user-review-delete-complete.jsp";
        }
        	   
        		//エラーページ作った。マイぺージへ戻る
        return "../error/user-review-delete-error.jsp";
    }
}