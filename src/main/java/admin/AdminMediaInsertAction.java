package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.Media;
import DAO.MediaDAO;
import tool.Action;

public class AdminMediaInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		
		String title = request.getParameter("title");
		String information = request.getParameter("information");
		String type = request.getParameter("type");
		String releaseDate = request.getParameter("releaseDate");
		String picture = request.getParameter("picture");
		String genre = request.getParameter("genre");
		System.out.println(genre);
		//入力チェック
		if (title == null || title.isBlank() || 
				information == null || information.isBlank() || 
				type == null || type.isBlank() || 
				releaseDate == null || releaseDate.isBlank()) {
			//エラーページあとで考える
			return "../error/admin-media-null-error.jsp";
		}
		
		

		MediaDAO dao = new MediaDAO();
		
		// 同じタイトルが存在するか
		if (dao.existsTitle(title)) {
		    return "../error/admin-media-title-error.jsp";
		}
		
		Media media = new Media();
		
		media.setTitle(title);
		media.setInformation(information);
		media.setType(type);
		media.setReleaseDate(releaseDate);
		media.setPicture(picture);
		media.setGenre(genre);


		//System.out.println(media); //デバッグ用
		
	//セッションとリクエストで同じタイトルならエラーページへ	
//		if(media.getTitle() == request.getParameter("title")) {
//		System.out.println("同一タイトル");
//		return "../error/admin-media-null-error.jsp";
//	}

		int result = dao.insert(media);
		if(result != 0) {
			session.setAttribute("Media", media);

			//登録完了画面へ
			return "admin-media-insert-complete.jsp";
		}
		
		//登録失敗エラーへ
		return "../error/admin-media-insert-error.jsp";
	}

}
