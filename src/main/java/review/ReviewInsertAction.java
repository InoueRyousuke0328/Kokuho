package review;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Review;
import Bean.User;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewInsertAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user"); //セッションからログイン情報を取得
		 
		 	//未ログインならエラーページへ
	        if (user == null) {
	            //エラーページあとで考える
	        	return "../error/userLogin-error.jsp";
	        }
	        
	        //レビューの入力情報を取得
	        String reviewText = request.getParameter("reviewText");
	        //メディアの詳細画面にいるからリクエストでいける？
	        
	        
	        int mediaCode = Integer.parseInt(request.getParameter("mediaCode"));
	        //評価を取得
	        int rating = Integer.parseInt(request.getParameter("rating"));
	        
	        
	        
	        if (reviewText == null || reviewText.isBlank() || reviewText.length() > 500
	        		|| reviewText.contains("<") || reviewText.contains(">")) {
	        	
	        	 request.setAttribute("reviewText", reviewText);

	             request.setAttribute("mediaCode", mediaCode);
	        	//エラーページあとで考える→作った
	        	return "../error/review-text-error.jsp";
	        }
	        
	        if (rating < 1 || rating > 5) {

	            request.setAttribute(
	                    "reviewText",
	                    reviewText);

	            request.setAttribute(
	                    "mediaCode",
	                    mediaCode);

	            request.setAttribute(
	                    "rating",
	                    rating);

	            return "../error/review-rating-error.jsp";
	        }
	        
	        int userAccountCode = user.getUserAccountCode();
	        System.out.println(mediaCode);
	        ReviewDAO dao = new ReviewDAO();

	        // 同じユーザーが同じ作品に投稿済みか確認
	        boolean exists =
	                dao.reviewExists(userAccountCode, mediaCode);

	        // 投稿済みの場合
	        if (exists) {

	            request.setAttribute("reviewText", reviewText);
	            request.setAttribute("mediaCode", mediaCode);
	            request.setAttribute("rating", rating);

	            return "../error/review-duplicate-error.jsp";
	        }
	        
	        
	        //Beanに値をセット
	        Review review = new Review();
	        review.setReview(reviewText);
	        review.setUserAccountCode(user.getUserAccountCode());
	        review.setMediaCode(mediaCode);
	        review.setRating(rating);

	        //DBへ登録
	        int result = dao.reviewInsert(review);

	        //登録成功なら、後で作る→作った
	        if (result > 0) {

	        	request.setAttribute("rating", rating);

	            request.setAttribute("mediaCode", mediaCode);

	            return "review-complete.jsp";
	        }

	        // 登録できなかった場合、後で作る
	        return "../error/review-text-error.jsp";
	    }
	}