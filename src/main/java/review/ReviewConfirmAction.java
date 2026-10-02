package review;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewConfirmAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String reviewText = request.getParameter("reviewText");

        
        String mediaCodeText = request.getParameter("mediaCode");

        String mode = request.getParameter("mode");
        
        String ratingText = request.getParameter("rating");
        
        // ★追加：検索条件を受け取る
        String keyword = request.getParameter("keyword");

        String genre = request.getParameter("genre");

        // ★追加：nullの場合は空文字にする
        if (keyword == null) {
            keyword = "";
        }

        if (genre == null) {
            genre = "";
        }

        System.out.println("ReviewConfirmAction 1：" + reviewText);
        System.out.println("ReviewConfirmAction 2：" + mediaCodeText);
        System.out.println("ReviewConfirmAction 3：" + mode);

        // 戻るボタンを押した場合
        if ("back".equals(mode)) {

            request.setAttribute("reviewText", reviewText);

            request.setAttribute("mediaCode", mediaCodeText);
            
            request.setAttribute("rating",ratingText);

         // ★追加
            request.setAttribute("keyword", keyword);

            // ★追加
            request.setAttribute("genre", genre);
            
            return "reviewInsert.jsp";
        }

        // レビュー本文の入力チェック
        if (reviewText == null
                || reviewText.isBlank()
                || reviewText.length() > 500
                || reviewText.contains("<")
                || reviewText.contains(">")) {

            request.setAttribute( "reviewText", reviewText);

            request.setAttribute( "mediaCode", mediaCodeText);
            
            request.setAttribute("rating",ratingText);
            
            // ★追加
            request.setAttribute("keyword", keyword);

            // ★追加
            request.setAttribute( "genre", genre);
            System.out.println("レビューだよ");//デバック用

            return "../error/review-text-error.jsp";
        }

        // mediaCodeの入力チェック
        if (mediaCodeText == null
                || mediaCodeText.isBlank()) {
        	System.out.println("mediaCodeがないよ");//デバック用

            return "../error/review-text-error.jsp";
        }

        // String型からint型へ変換
        int mediaCode;
        int rating;

        try {

            mediaCode = Integer.parseInt(mediaCodeText);
            rating = Integer.parseInt(ratingText);

        } catch (NumberFormatException e) {      
        	request.setAttribute( "reviewText", reviewText);

            request.setAttribute( "mediaCode", mediaCodeText);
            
            request.setAttribute("rating",ratingText);
            
            // ★追加
            request.setAttribute("keyword", keyword);

            // ★追加
            request.setAttribute( "genre", genre);

            return "../error/review-text-error.jsp";
        }
        
     // 評価が1～5か確認
        if (rating < 1 || rating > 5) {

            request.setAttribute("reviewText", reviewText);
            request.setAttribute("mediaCode", mediaCodeText);
            request.setAttribute("rating", ratingText);
            request.setAttribute("keyword", keyword);
            request.setAttribute("genre", genre);

            return "../error/review-rating-error.jsp";
        }

        // ログインユーザーを取得
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        
        int userAccountCode = user.getUserAccountCode();

        // 同じ作品に投稿済みか確認
        ReviewDAO dao = new ReviewDAO();

        boolean exists = dao.reviewExists(userAccountCode,mediaCode);

        // 投稿済みの場合
        if (exists) {

            request.setAttribute("mediaCode", mediaCodeText);

            return "../error/review-duplicate-error.jsp";
        }
        
        //　対象が「国宝」、評価が「1～4」の場合
        if(mediaCode == 31 && rating < 5 ) {
            request.setAttribute("reviewText", reviewText);
            request.setAttribute("mediaCode", mediaCodeText);
            request.setAttribute("rating", ratingText);
            request.setAttribute("keyword", keyword);
            request.setAttribute("genre", genre);
            
            return "../error/review-kokuho-negative-rating-error.jsp";
        }
        	
        
        
        // 確認画面へ渡す値
        request.setAttribute( "reviewText", reviewText);

        request.setAttribute( "mediaCode", mediaCodeText);
        
        request.setAttribute("rating", rating);
        
     // ★追加
        request.setAttribute("keyword", keyword);

        // ★追加
        request.setAttribute("genre", genre);

        return "review-confirm.jsp";
    }
}
