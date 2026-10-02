package review;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import Bean.Review;
import DAO.MediaDAO;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewGetAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        int mediaCode = Integer.parseInt(
                request.getParameter("mediaCode"));

        // 検索条件を受け取る
        String keyword = request.getParameter("keyword");
        String genre = request.getParameter("genre");

        if (keyword == null) {
            keyword = "";
        }
		
		// 詳細JSPへ検索キーワードを渡す
        if (genre == null) {
            genre = "";
        }

        MediaDAO mediaDAO = new MediaDAO();
        Media media = mediaDAO.mediaInformation(mediaCode);

        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviewList =
                reviewDAO.reviewSearch(mediaCode);

        session.setAttribute("mediaInfo", media);
        
        System.out.println(session.getAttribute("mediaInfo")); // 
        
        session.setAttribute("reviewList", reviewList);

        // 詳細JSPへ検索条件を渡す
        request.setAttribute("keyword", keyword);
        request.setAttribute("genre", genre);

        // デバッグ用
        System.out.println("keyword = [" + keyword + "]");
        System.out.println("genre = [" + genre + "]");

        return "../media/mediaInformation.jsp";
    }
}