package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import Bean.Media;
import tool.Action;

//画像アップロード兼入力チェック
//メディア新規登録で使用
public class AdminMediaUploadAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Media media = new Media();

		media.setTitle(request.getParameter("title"));
		media.setInformation(request.getParameter("information"));
		media.setType(request.getParameter("type"));
		if(media.getTitle()==null) {
			return "../error/admin-media-null-error.jsp";
		}

		//フォームから送られた発売日が空文字列の場合"現在公開中"に置き換える
		if((request.getParameter("releaseDate").equals(""))){
			media.setReleaseDate("現在公開中");
		}else {
			media.setReleaseDate(request.getParameter("releaseDate"));
		}

		media.setGenre(request.getParameter("genre"));
		String genre=request.getParameter("genre");
		System.out.println(genre);
		request.setAttribute("Media", media);
		//media.setPicture(request.getParameter("uploadfile"));

		//System.out.println(media); //デバッグ用



		// <input type="file" name="uploadfile">からMultipart形式のアップロードコンテンツの内容を取得
		Part part = request.getPart("uploadfile");
		
		//フォームのバリデーションをすり抜けた場合の保険
		if(part==null) {
			return "../error/admin-media-null-error.jsp";
		}
		
		//異常系（フォームから受け取ったMIMEタイプの大分類がimageでない場合）
		if(!(part.getContentType().substring(0,5).equals("image"))){
			return "../error/admin-media-add-file-error.jsp";
		
		//正常系	
		}else if((part.getContentType().substring(0,5).equals("image"))){

			String picture = null;
			for (String cd : part.getHeader("Content-Disposition").split(";")) {
				//System.out.println(cd);
				cd = cd.trim();
				if (cd.startsWith("filename")) {
					// ファイル名は=の右側以降の文字列。
					// ただし利用環境によってはだブルコーテーションが含まれているので、取り除く。
					picture = cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
					break;
				}
			}


			media.setPicture(picture);
			request.setAttribute("Media", media);

			System.out.println(media); //デバッグ用

			// アップロードしたファイルを書き出す
			if (picture != null /*&& dao.search(filename).size() == 0*/) {
				// アップロードされたファイル名は、OS依存のファイルパスなどを含んでいるので置換する。
				// \は/に置換し、その後ファイル名のみ抽出する。
				picture = picture.replace("\\", "/");
				int pos = picture.lastIndexOf("/");
				if (pos >= 0) {
					picture = picture.substring(pos + 1);
				}

				// 実行パスの「images」フォルダにファイルをアップロードする場合の指定
				part.write(request.getServletContext().getRealPath("/")+ "/upload/images/" + picture);
				//			part.write("192.168.33.116:8080"+ "/upload/images/" + picture);

				System.out.println(request.getServletContext().getRealPath("/")+ "/upload/images/" + picture);


			}
		}

		//入力チェック
		if (media.getTitle() == null || media.getTitle().isBlank() || 
				media.getInformation() == null || media.getInformation().isBlank() || 
				media.getType() == null || media.getType().isBlank() || 
				media.getReleaseDate() == null || media.getReleaseDate().isBlank() ||
				media.getPicture() == null || media.getPicture().isBlank() ||
				media.getGenre() == null || media.getGenre().isBlank() 
				) {
			//エラーページあとで考える
			return "../error/admin-media-null-error.jsp";
		}

		//		if(media.getTitle() == request.getParameter("title")) {
		//			System.out.println("同一タイトル");
		//			return "../error/admin-media-null-error.jsp";		}
		//		}		


		return "admin-media-insert-check.jsp"; //urlは後日ブラッシュアップ

		//セッション属性"Media"とリクエストの内容が同じならキックする仕組みを考える
		//		}else {
		//			if()


	}
}	


