package review;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Review;
import Bean.User;
import DAO.ReviewDAO;
import tool.Action;

public class ReviewListAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		User user = (User)session.getAttribute("user");

		if(user == null){
			return "../error/review-error.jsp";
		}

		ReviewDAO dao = new ReviewDAO();

		List<Review> list = dao.myReview(user.getUserAccountCode());


		request.setAttribute("reviewList", list);

		return "review-list.jsp";
	}
}