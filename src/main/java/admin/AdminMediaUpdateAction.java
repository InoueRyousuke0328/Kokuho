package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaUpdateAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		Media mediaInfo = (Media) session.getAttribute("mediaInfo");
		System.out.println(mediaInfo); //デバッグ用
		
		MediaDAO dao = new MediaDAO();
		
		if (mediaInfo.getTitle() == null || mediaInfo.getTitle().isBlank() || 
				mediaInfo.getInformation() == null || mediaInfo.getInformation().isBlank() || 
				mediaInfo.getType() == null || mediaInfo.getType().isBlank() || 
				mediaInfo.getReleaseDate() == null || mediaInfo.getReleaseDate().isBlank()) {
			//エラーページあとで考える
			return "../error/admin-media-null-error.jsp";
		}
		
		//国宝のタイトルをキングダムにしたとき
		if (mediaInfo.getMediaCode() == 31
		        && mediaInfo.getTitle().trim().contains("キングダム")) {

		    String deletedPicture = dao.deletedMediaPicture(159);

		    request.setAttribute("deletedPicture", deletedPicture);

		    return "../error/admin-media-kingdom-error.jsp";
		}
		
		
		//国宝は更新禁止
        if (mediaInfo.getMediaCode() == 31) {
            return "../error/admin-media-update-protected.jsp";
        }
		

		//if (mediaInfo.getTitle() == null || mediaInfo.getTitle().isBlank() || 
		//		mediaInfo.getInformation() == null || mediaInfo.getInformation().isBlank() || 
		//		mediaInfo.getType() == null || mediaInfo.getType().isBlank() || 
		//		mediaInfo.getReleaseDate() == null || mediaInfo.getReleaseDate().isBlank()) {
			//エラーページあとで考える
		//	return "../error/admin-media-null-error.jsp";
		//}
		
		
		mediaInfo.setTitle(mediaInfo.getTitle());
		mediaInfo.setInformation(mediaInfo.getInformation());
		mediaInfo.setType(mediaInfo.getType());
		mediaInfo.setReleaseDate(mediaInfo.getReleaseDate());
		mediaInfo.setPicture(mediaInfo.getPicture());
		mediaInfo.setGenre(mediaInfo.getGenre());
		
		System.out.println(mediaInfo);
		
		int result = dao.update(mediaInfo);
		if(result != 0) {
			session.setAttribute("mediaInfo", mediaInfo);
			
			session.removeAttribute("list");
			session.removeAttribute("keyword");
			//登録完了画面へ
			return "admin-media-update-complete.jsp";
		}
		
		//登録失敗エラーへ
		return "../error/admin-media-insert-error.jsp";
	}

}
