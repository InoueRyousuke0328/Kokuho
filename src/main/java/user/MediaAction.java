package user;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class MediaAction extends Action{
	public String execute
	(HttpServletRequest request,HttpServletResponse response)
			throws Exception{

		HttpSession session=request.getSession();
		String title=request.getParameter("keyword");
		
		if(title==null) title="";
		

		MediaDAO dao=new MediaDAO();
		List<Media> list=dao.mediaSearch(title);
		
		System.out.println(list); //デバッグ用
		System.out.println(title); //デバッグ用
		

		session.setAttribute("list",list);
		session.setAttribute("keyword", title );
		
		if(session.getAttribute("admin") != null){
			return "../admin/admin-media-update.jsp";
		}
		return "../media/mediaSearch.jsp";
	}
}
