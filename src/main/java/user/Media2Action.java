package user;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class Media2Action extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {
    	HttpSession session=request.getSession();
    	String keyword;
    	String genre;
    	if(request.getParameter("keyword")==null) {
    		 keyword=(String)session.getAttribute("gingaman");
    		  genre =(String)session.getAttribute("genre");
    	}else {

        keyword =
                request.getParameter("keyword");
         genre =
                request.getParameter("genre");
    	}

       

        if (keyword == null) {
            keyword = "";
        }

        if (genre == null) {
            genre = "";
        }

        keyword = keyword.trim();
        genre = genre.trim();

        MediaDAO dao = new MediaDAO();

        List<Media> list =
                dao.mediaSearch2(keyword, genre);
        
       

        // デバッグ用
       // System.out.println("keyword = " + keyword);
       // System.out.println("genre = " + genre);
       // System.out.println("list = " + list);

        //request.setAttribute("list", list);
        //request.setAttribute("keyword", keyword);
        //request.setAttribute("genre", genre);
        session.setAttribute("genre",genre);
        session.setAttribute("risu", list);
        session.setAttribute("gingaman", keyword);

        return "../media/mediaSearch.jsp";
    }
}