package admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaDeleteAction extends Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("kouho")!=null) {
			session.removeAttribute("kouho");
			
		}else {
			
			
		}
		String title=request.getParameter("title");
		
		//キーワード検索の入力内容を保存
		session.setAttribute("shinenote", title);
		
		
		MediaDAO dao=new MediaDAO();
		List<Media> list=dao.mediaSearch(title);
		//結果の一覧を
		session.setAttribute("kouho", list);
		
		return "admin-media-delete-kouho.jsp";
		
				
	}


}
