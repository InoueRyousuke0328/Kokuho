package user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import tool.Action;

public class IndexAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		Integer count = (Integer) session.getAttribute("count");
		
		
		if(count == null) {
			count = 0;
		}
		
		count++;
		System.out.println(count);
		session.setAttribute("count", count);
		

		if(count >= 10){
			
			session.removeAttribute("count");
			response.sendRedirect("https://kokuhou-movie.com/");
//			return "redirecthttps://kokuhou-movie.com/";
			return null;
		}
		//response.sendRedirect("../user/index.jsp");
//		return  "redirect../user/index.jsp";
		return "../user/index.jsp";
				
	}

}
