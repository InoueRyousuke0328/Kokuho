package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.ReviewDAO;
import tool.Action;

public class AdminReviewDeleteAction
        extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {
    	String searchTitle=request.getParameter("searchTitle");

        String reviewCodeText = request.getParameter("reviewCode");

        String mediaCodeText = request.getParameter("mediaCode");

        if (reviewCodeText == null
                || mediaCodeText == null) {

            return "../error/admin-review-delete-error.jsp";
        }

        int reviewCode;
        int mediaCode;

        try {
            reviewCode = Integer.parseInt(reviewCodeText);

            mediaCode = Integer.parseInt(mediaCodeText);

        } catch (NumberFormatException e) {

            return "../error/admin-review-delete-error.jsp";
        }

        ReviewDAO dao = new ReviewDAO();

        int result = dao.adminReviewDelete(reviewCode);

        if (result > 0) {

            request.setAttribute("mediaCode", mediaCode);
            request.setAttribute("searchTitle",searchTitle);

            return "admin-review-delete-complete.jsp";
        }
        request.setAttribute("mediaCode", mediaCode);
        return "../error/admin-review-delete-error.jsp";
    }
}