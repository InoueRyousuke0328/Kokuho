package admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Review;
import DAO.ReviewDAO;
import tool.Action;

public class AdminReviewListAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        String mediaCodeText = request.getParameter("mediaCode");
        
        // 検索キーワードを受け取る
        String searchTitle = request.getParameter("searchTitle");
        String mediaList=request.getParameter("mediaList");
        
        if (searchTitle == null) {
            searchTitle = "";
        }

        if (mediaCodeText == null
                || mediaCodeText.isBlank()) {
        		//エラーページ作った
            return "../error/admin-review-error.jsp";
        }

        int mediaCode;

        try {
            mediaCode = Integer.parseInt(mediaCodeText);

        } catch (NumberFormatException e) {

            return "../error/admin-review-error.jsp";
        }

        ReviewDAO dao = new ReviewDAO();

        List<Review> list = dao.reviewSearch(mediaCode);

        request.setAttribute("reviewList", list);
        
        request.setAttribute("mediaList",mediaList);

        request.setAttribute("mediaCode", mediaCode);
        
        request.setAttribute("searchTitle", searchTitle);

        return "admin-review-list.jsp";
    }
}