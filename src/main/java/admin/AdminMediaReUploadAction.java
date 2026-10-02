package admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import Bean.Media;
import tool.Action;

//画像アップロード兼入力チェック
//メディア修正機能で使用
public class AdminMediaReUploadAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();

		Media mediaInfo = (Media) session.getAttribute("mediaInfo");

		mediaInfo.setTitle(request.getParameter("title"));
		mediaInfo.setInformation(request.getParameter("information"));
		mediaInfo.setType(request.getParameter("type"));;

		if((request.getParameter("releaseDate").equals(""))){
			mediaInfo.setReleaseDate("現在公開中");
		}else {
			mediaInfo.setReleaseDate(request.getParameter("releaseDate"));
		}

		mediaInfo.setGenre(request.getParameter("genre"));



		// <input type="file" name="uploadfile">からMultipart形式のアップロードコンテンツの内容を取得
		Part part = request.getPart("uploadfile");

		System.out.println("ReUpload 1：" + request.getContextPath()); //デバッグ用
		System.out.println("ReUpload 2：" + request.getQueryString()); //デバッグ用
		System.out.println("ReUpload 3：" + part.getContentType()); //デバッグ用
		System.out.println("ReUpload 3：" + part.getContentType().substring(0,5)); //デバッグ用

		//正常系（画像選択ナシ）
		if(part.getContentType().equals("application/octet-stream")) {
			System.out.println("ReUpload 4：" + part.getContentType()); //デバッグ用

		}//異常系
		else if(!(part.getContentType().substring(0,5).equals("image"))){
			return "../error/admin-media-update-file-error.jsp";
		}

		//正常系（画像選択アリ）
		else if(part.getContentType().substring(0,5).equals("image")){
			//編集画面で画像が選択された場合の処理
			String picture = null;
			for (String cd : part.getHeader("Content-Disposition").split(";")) {
				System.out.println("あ："+cd); //デバッグ用
				cd = cd.trim();
				if (cd.startsWith("filename")) {
					// ファイル名は=の右側以降の文字列。
					// ただし利用環境によってはだブルコーテーションが含まれているので、取り除く。
					picture = cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
					System.out.println("ReUpload 5：" + picture); //デバッグ用
					break;
				}
			}




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
				//				System.out.println(picture); //デバッグ用

				System.out.println(request.getServletContext().getRealPath("/")+ "/upload/images/" + picture);
				mediaInfo.setPicture(picture);
			}


		}


		//入力チェック
		if (mediaInfo.getTitle() == null || mediaInfo.getTitle().isBlank() || 
				mediaInfo.getInformation() == null || mediaInfo.getInformation().isBlank() || 
				mediaInfo.getType() == null || mediaInfo.getType().isBlank() || 
				mediaInfo.getReleaseDate() == null || mediaInfo.getReleaseDate().isBlank() ||
				mediaInfo.getPicture() == null || mediaInfo.getPicture().isBlank() ||
				mediaInfo.getGenre() == null || mediaInfo.getGenre().isBlank() 
				) {
			//エラーページあとで考える
			return "../error/admin-media-null-error.jsp";
		}

		//		if(media.getTitle() == request.getParameter("title")) {
		//			System.out.println("同一タイトル");
		//			return "../error/admin-media-null-error.jsp";		}
		//		}		

		session.setAttribute("mediaInfo", mediaInfo);
		return "admin-media-update-confirm.jsp"; //urlは後日ブラッシュアップ

		//セッション属性"Media"とリクエストの内容が同じならキックする仕組みを考える
		//		}else {
		//			if()


	}
}	


