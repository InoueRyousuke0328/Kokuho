package media;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class RankingAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        MediaDAO dao = new MediaDAO();

        List<Media> rankingList = dao.ranking();

        request.setAttribute("rankingList", rankingList);

        return "../media/ranking.jsp";
    }
}