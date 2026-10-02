package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaGetAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 HttpSession session = request.getSession();
			
		int mediaCode =  Integer.parseInt(request.getParameter("mediaCode")); 
		
		
		// 検索キーワードを受け取る
       String keyword = request.getParameter("keyword");

       if (keyword == null) {
           keyword = "";
       }
		
		MediaDAO dao = new MediaDAO();
		Media media = dao.mediaInformation(mediaCode);
	

		session.setAttribute("mediaInfo",media);
		
		System.out.println(media);
		

		return "../admin/admin-media-update-form.jsp";
	}

}
