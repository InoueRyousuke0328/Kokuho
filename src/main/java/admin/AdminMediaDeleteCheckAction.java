package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaDeleteCheckAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code=request.getParameter("code");
		if(code!=null) {
		int mediaCode=Integer.parseInt(code);
		MediaDAO dao=new MediaDAO();
		Media honmei=dao.mediaInformation(mediaCode);
		if(honmei!=null) {
			request.setAttribute("honmei", honmei);
			return "admin-media-delete-rakuni.jsp";
			
		}
		return "../error/admin-media-nonumber-error.jsp";
		}	
		return "admin-media-delete-kouho.jsp";
		
	}
	

}
