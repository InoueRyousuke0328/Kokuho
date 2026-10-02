package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Review;
import DAO.ReviewDAO;
import tool.Action;

public class AdminReviewDeleteConfirmAction
        extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        String reviewCodeText =
                request.getParameter("reviewCode");
        String searchTitle = request.getParameter("searchTitle");
        String mediaList=request.getParameter("mediaList");
        String userName=request.getParameter("userName");
        

        if (reviewCodeText == null
                || reviewCodeText.isBlank()) {

            return "../error/admin-review-error.jsp";
        }

        int reviewCode;

        try {
            reviewCode =
                Integer.parseInt(reviewCodeText);

        } catch (NumberFormatException e) {

            return "admin-review-error.jsp";
        }

        ReviewDAO dao = new ReviewDAO();

        Review review =
                dao.adminReviewCheck(reviewCode);

        if (review == null) {
            return "../error/admin-review-error.jsp";
        }
        
        
        request.setAttribute(
                "review", review);
        request.setAttribute("searchTitle", searchTitle);
        request.setAttribute("mediaList", mediaList);
        request.setAttribute("userName", userName);

        System.out.println(review); //デバッグ用
        System.out.println(searchTitle); //デバッグ用
        System.out.println(mediaList); //デバッグ用
        return "admin-review-delete-confirm.jsp";
    }
}