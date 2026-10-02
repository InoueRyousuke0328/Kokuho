package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Admin;
import DAO.AdminDAO;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaDeleteSakuzyoAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mediaCode=Integer.parseInt(request.getParameter("code"));
		HttpSession session = request.getSession();
		Admin sonzai=(Admin)session.getAttribute("admin");

		AdminDAO das=new AdminDAO();
		Admin check=das.adminSearch(sonzai.getAdminAccountCode());

		if(check==null) {
			session.invalidate();
			return "../error/adminLogin-error.jsp";
		}

		MediaDAO dao=new MediaDAO();
		int kazu=dao.mediaCheck(mediaCode);

		if(kazu==0) {
			return "../error/admin-media-nonumber-error.jsp";
		}
		
		//国宝は削除禁止
        if (mediaCode == 31) {
            return "../error/admin-media-delete-protected.jsp";
        }


		int judge=dao.mediaDelete(mediaCode);
		if(judge==1) {
			session.removeAttribute("kouho");
			session.removeAttribute("shinenote");
			return "admin-media-delete-vdaze.jsp";
		}
		return "../error/admin-media-delete-false.jsp";
	}
}




