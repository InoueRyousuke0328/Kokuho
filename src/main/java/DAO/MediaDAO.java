package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.Media;

public class MediaDAO extends DAO {
	
	//メディアの新規登録に使用、更新した列数を返す
	public int update(Media media) throws SQLException, Exception {
		try(
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement("update media set title = ?, information = ?, type = ?, releaseDate = ?, picture = ?, genre = ? where mediaCode = ? ");
				){
			con.setAutoCommit(false);
			
				st.setString(1, media.getTitle());
				st.setString(2, media.getInformation());
				st.setString(3, media.getType());
				st.setString(4, media.getReleaseDate());
				st.setString(5, media.getPicture());
				st.setString(6, media.getGenre());
				st.setInt(7, media.getMediaCode());
				
				int line = st.executeUpdate();
				
				if(line == 0) {
					con.rollback();
					con.setAutoCommit(true);
					return 0;
				}
			
			con.commit();
			con.setAutoCommit(true);
			return line;
			}
	}
	

	//メディアの新規登録に使用、更新した列数を返す
	public int insert(Media media) throws SQLException, Exception {
		try(
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement("insert into media(title, information, type, releaseDate, picture, genre) values (?, ?, ?, ?, ?, ?)");
				){
			con.setAutoCommit(false);
			
				st.setString(1, media.getTitle());
				st.setString(2, media.getInformation());
				st.setString(3, media.getType());
				st.setString(4, media.getReleaseDate());
				st.setString(5, media.getPicture());
				st.setString(6, media.getGenre());
				int line = st.executeUpdate();
				
				if(line == 0) {
					con.rollback();
					con.setAutoCommit(true);
					return 0;
				}
			
			con.commit();
			con.setAutoCommit(true);
			return line;
			}
	}
	
	//メディア検索で使用、受け取ったキーワードから該当作品をリストに格納して返す
	//メディア修正でも使用
	public List<Media> mediaSearch(String title)throws Exception{
		List<Media> list = new ArrayList<>();

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(
	        		   "SELECT * FROM media " +
	        		            "WHERE title LIKE ? " +
	        		            "AND mediaDelete = 0 " +
	        		            "ORDER BY mediaCode DESC"
	        		        )
	        		    ) {

	        		        st.setString(1, "%" + title + "%");

	        		        ResultSet rs = st.executeQuery();

	    	
	    while (rs.next()) {

            Media media = new Media();

            media.setMediaCode(rs.getInt("mediaCode"));
            media.setTitle(rs.getString("title"));
            media.setInformation(rs.getString("information"));
            media.setType(rs.getString("type"));
            media.setReleaseDate(rs.getString("releaseDate"));	
            media.setPicture(rs.getString("picture"));
            media.setGenre(rs.getString("genre"));
            list.add(media);
            
            
        }
    }
    return list;
}    
	public List<Media> mediaSearch2(String genre)throws Exception{
		List<Media> list = new ArrayList<>();

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(
	        "SELECT * FROM media WHERE genre LIKE ? AND mediaDelete = 0");){
	   
	    st.setString(1,"%" + genre + "%");	
	    ResultSet rs = st.executeQuery();
	    	
	    while (rs.next()) {

            Media media = new Media();

            media.setMediaCode(rs.getInt("mediaCode"));
            media.setTitle(rs.getString("title"));
            media.setInformation(rs.getString("information"));
            media.setType(rs.getString("type"));
            media.setReleaseDate(rs.getString("releaseDate"));	
            media.setPicture(rs.getString("picture"));
            media.setGenre(rs.getString("genre"));
            list.add(media);
            
            
        }
    }
    return list;
}    

	//メディア詳細情報画面で使用、引数のmediaCodeと紐づくデータをmediaBeanに格納して返す
	//★追加：作品情報と一緒にレビューの平均評価を取得する
	public Media mediaInformation(int mediaCode) throws Exception {
	    Media media = null;

	    //★変更：reviewテーブルと結合して平均評価を取得
	    String sql =
	        "SELECT "
	      + "m.mediaCode, "
	      + "m.title, "
	      + "m.information, "
	      + "m.type, "
	      + "m.releaseDate, "
	      + "m.picture, "
	      + "m.genre, "
	      + "COALESCE(AVG(r.rating), 0) AS averageRating "
	      + "FROM media m "
	      + "LEFT JOIN review r "
	      + "ON m.mediaCode = r.mediaCode "
	      + "AND r.reviewDelete = 0 "
	      + "WHERE m.mediaCode = ? "
	      + "AND m.mediaDelete = 0 "
	      + "GROUP BY "
	      + "m.mediaCode, "
	      + "m.title, "
	      + "m.information, "
	      + "m.type, "
	      + "m.releaseDate, "
	      + "m.picture, "
	      + "m.genre";
	   
	    try (
	        Connection con = getConnection();
	        PreparedStatement st =
	            con.prepareStatement(sql);
	    ) {

	        st.setInt(1, mediaCode);

	        try (ResultSet rs = st.executeQuery()) {

	            if (rs.next()) {

	                media = new Media();

	                media.setMediaCode(
	                        rs.getInt("mediaCode"));

	                media.setTitle(
	                        rs.getString("title"));

	                media.setInformation(
	                        rs.getString("information"));

	                media.setType(
	                        rs.getString("type"));

	                media.setReleaseDate(
	                        rs.getString("releaseDate"));

	                media.setPicture(
	                        rs.getString("picture"));

	                media.setGenre(
	                        rs.getString("genre"));

	                //★追加：平均評価をMedia Beanへセット
	                media.setAverageRating(
	                        rs.getDouble("averageRating"));

	                
	            }
	        }
	    }

	    return media;
	}

	//重複チェック
	//user14が作品が存在し削除されていないかを確認するために使うために書き換えました
	public int mediaCheck(int mediaCode) throws Exception {

	    int count = 0;

	    try (
	        Connection con = getConnection();
	        PreparedStatement st =
	            con.prepareStatement(
	                "SELECT COUNT(*) FROM media WHERE mediaCode = ? and mediaDelete=0");
	    ) {

	        st.setInt(1, mediaCode);

	        ResultSet rs = st.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    }

	    return count;
	}

	//メディア削除、更新した削除フラグの数を返す
	public int mediaDelete(int mediaCode) throws Exception {

	    int line = 0;

	    try (
	        Connection con = getConnection();
	        PreparedStatement st =
	        con.prepareStatement(
	        "UPDATE media SET mediaDelete = 1 WHERE mediaCode = ?");
	    ) {
	    	con.setAutoCommit(false);

	        st.setInt(1, mediaCode);
	        line = st.executeUpdate();
	        if(line!=1) {
	        	con.rollback();
	        	con.setAutoCommit(true);
	        
	        	line=0;
	        }else {
	        	con.commit();
	        	con.setAutoCommit(true);
	        	line=1;
	        }
	    }

	    return line;
	}

	public List<Media> mediaSearch2(String keyword, String genre) throws Exception {

	    List<Media> list = new ArrayList<>();

	    String sql =
	        "SELECT m.mediaCode, m.title, m.information, " +
	        "m.type, m.releaseDate, m.picture, m.genre, " +
	        "COALESCE(AVG(r.rating), 0) AS averageRating, " +
	        "COUNT(r.reviewCode) AS reviewCount " +
	        "FROM media m " +
	        "LEFT JOIN review r " +
	        "ON m.mediaCode = r.mediaCode " +
	        "AND r.reviewDelete = 0 " +
	        "WHERE m.mediaDelete = 0 " +
	        "AND m.title LIKE ? " +
	        "AND (? = '' OR m.genre = ?) " +
	        "GROUP BY m.mediaCode, m.title, m.information, " +
	        "m.type, m.releaseDate, m.picture, m.genre " +
	        "ORDER BY " +
	        "CASE " +
	        //mediaserachで全検索の場合の並び順
	        "WHEN m.title = '国宝' THEN 0 " +
	        "WHEN m.title REGEXP '^[A-Za-z]' THEN 1 " +
	        "WHEN m.title REGEXP '^[ぁ-んァ-ヶー]' THEN 2 " +
	        "ELSE 3 " +
	        "END, " +
	        "m.title ASC";

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql)
	    ) {

	        st.setString(1, "%" + keyword + "%");
	        st.setString(2, genre);
	        st.setString(3, genre);

	        try (ResultSet rs = st.executeQuery()) {

	            while (rs.next()) {

	            	Media media = new Media();

	            	media.setMediaCode(rs.getInt("mediaCode"));
	            	media.setTitle(rs.getString("title"));
	            	media.setInformation(rs.getString("information"));
	            	media.setType(rs.getString("type"));
	            	media.setReleaseDate(rs.getString("releaseDate"));
	            	media.setPicture(rs.getString("picture"));
	            	media.setGenre(rs.getString("genre"));

	            	media.setAverageRating(rs.getDouble("averageRating"));
	            	media.setReviewCount(rs.getInt("reviewCount"));

	            	list.add(media);
	            }
	        }
	    }

	    return list;
	}
	
	public List<Media> ranking() throws Exception {

	    List<Media> list = new ArrayList<>();

	    Connection con = getConnection();

	    String sql =
	        "SELECT m.mediaCode, m.title, m.picture, " +
	        "AVG(r.rating) AS averageRating, " +
	        "COUNT(r.reviewCode) AS reviewCount " +
	        "FROM media m " +
	        "JOIN review r ON m.mediaCode = r.mediaCode " +
	        "WHERE m.mediaDelete = 0 " +
	        "AND r.reviewDelete = 0 " +
	        "GROUP BY m.mediaCode, m.title, m.picture " +
	        "ORDER BY " +
	        "CASE " +
	        "WHEN m.mediaCode = 31 THEN 0 " +
	        "ELSE 1 " +
	        "END, " +
	        "averageRating DESC, " +
	        "reviewCount DESC " +
	        "LIMIT 10";
	        

	    PreparedStatement st = con.prepareStatement(sql);
	    ResultSet rs = st.executeQuery();

	    while (rs.next()) {

	        Media media = new Media();

	        media.setMediaCode(rs.getInt("mediaCode"));
	        media.setTitle(rs.getString("title"));
	        media.setPicture(rs.getString("picture"));
	        media.setAverageRating(rs.getDouble("averageRating"));
	        media.setReviewCount(rs.getInt("reviewCount"));

	        list.add(media);
	    }

	    rs.close();
	    st.close();
	    con.close();

	    return list;
	}
	
	//メディア新規追加の重複チェック
	public boolean existsTitle(String title) throws Exception {

	    Connection con = getConnection();

	    String sql = "SELECT COUNT(*) FROM media WHERE title = ? AND mediaDelete = 0";

	    PreparedStatement st = con.prepareStatement(sql);
	    st.setString(1, title);

	    ResultSet rs = st.executeQuery();

	    boolean exists = false;

	    if (rs.next()) {
	        exists = rs.getInt(1) > 0;
	    }

	    rs.close();
	    st.close();
	    con.close();

	    return exists;
	}
	
	//王騎将軍による平澤対策のメソッド（論理削除したメディアの画像を持ってくる）
	public String deletedMediaPicture(int mediaCode) throws Exception {

	    Connection con = getConnection();

	    String sql =
	        "SELECT picture " +
	        "FROM media " +
	        "WHERE mediaCode = ? " +
	        "AND mediaDelete = 1";

	    PreparedStatement st = con.prepareStatement(sql);
	    st.setInt(1, mediaCode);

	    ResultSet rs = st.executeQuery();

	    String picture = null;

	    if (rs.next()) {
	        picture = rs.getString("picture");
	    }

	    rs.close();
	    st.close();
	    con.close();

	    return picture;
	}
	
}
