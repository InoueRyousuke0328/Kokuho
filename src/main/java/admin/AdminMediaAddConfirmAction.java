package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import tool.Action;

//登録確認画面で修正押下時、内容を入力画面に渡すだけのライツカメラアクション
public class AdminMediaAddConfirmAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String information = request.getParameter("information");
		String type = request.getParameter("type");
		String releaseDate = request.getParameter("releaseDate");
		String picture = request.getParameter("picture");
		String genre=request.getParameter("genre");


//		String mode = request.getParameter("mode");

//			System.out.println(mode); //デバッグ用
			
		//戻るボタン押した場合
//		if ("back".equals(mode)) {
			request.setAttribute("title", title);
			request.setAttribute("information", information);
			request.setAttribute("type", type);
			request.setAttribute("releaseDate", releaseDate);
			request.setAttribute("uploadfile", picture);
			request.setAttribute("genre", genre);

			return "admin-media-add.jsp";
		}




		//入力チェック
//		if (title == null || title.isBlank() || 
//				information == null || information.isBlank() || 
//				type == null || type.isBlank() || 
//				releaseDate == null || releaseDate.isBlank()) {
//			//エラーページあとで考える
//			return "adminnull-error.jsp";
//		}
//		
//		MediaDAO dao = new MediaDAO();
//		Media media = new Media();
//		media.setTitle(title);
//		media.setInformation(information);
//		media.setType(type);
//		media.setReleaseDate(releaseDate);
//		media.setPicture(picture);
//		
//		System.out.println(media);
//		
//		dao.insert(media);
//
//		session.setAttribute("Media", media);
//
//		//登録確認画面へ
//		return "admin-media-insert-complete.jsp";
//	}

}
