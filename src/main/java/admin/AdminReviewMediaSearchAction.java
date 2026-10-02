package admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminReviewMediaSearchAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {
    	
    	//HttpSession session=request.getSession();
    	//session.removeAttribute("searchTitle");
    	//session.removeAttribute("mediaList");
    	

        String searchTitle = request.getParameter("searchTitle");
        
        // 最初に画面を開いた場合や、
        // 検索欄が空の場合は空文字にする
        if (searchTitle == null) {
        	searchTitle = "";
        }

        searchTitle = searchTitle.trim();

        MediaDAO dao = new MediaDAO();

        List<Media> list = dao.mediaSearch(searchTitle);

        request.setAttribute("mediaList", list);

        // 検索欄に入力内容を残す
        request.setAttribute("searchTitle", searchTitle);
        // session.setAttribute("searchTitle",searchTitle);
        return "admin-review-media-search.jsp";
    }
}