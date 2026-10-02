package review;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Review;
import Bean.User;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewDeleteConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "../error/user-review-delete-error.jsp";
        }

        String reviewCodeText = request.getParameter("reviewCode");

        if (reviewCodeText == null
                || reviewCodeText.isBlank()) {

            return "../error/user-review-delete-error.jsp";
        }

        int reviewCode;

        try {
            reviewCode = Integer.parseInt(reviewCodeText);

        } catch (NumberFormatException e) {

            return "../error/user-review-delete-error.jsp";
        }

        ReviewDAO dao = new ReviewDAO();

        Review review =
                dao.reviewCheck(
                    reviewCode,
                    user.getUserAccountCode());

        if (review == null) {
            return "../error/user-review-delete-error.jsp";
        }

        request.setAttribute("review", review);

        return "review-delete-confirm.jsp";
    }
}