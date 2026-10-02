package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.Review;

public class ReviewDAO extends DAO{

	//作品情報詳細ページにレビューの一覧を表示するためのメソッド
	public List<Review> reviewSearch(int mediaCode) throws  Exception{
		List<Review> list = new ArrayList<>();

		String sql =
				"SELECT "
						+ "r.reviewCode, "
						+ "r.review, "
						+ "r.reviewDate, "
						+ "r.rating, "
						+ "r.userAccountCode, "
						+ "r.mediaCode, "
						+ "u.userName, "
						+ "m.title "
						+ "FROM review r "
						+ "JOIN media m "
						+ "ON r.mediaCode = m.mediaCode "
						+ "JOIN user u "
						+ "ON r.userAccountCode = u.userAccountCode "
						+ "WHERE r.mediaCode = ? "
						+ "AND r.reviewDelete = 0 "
						+ "AND m.mediaDelete = 0 "
						+ "ORDER BY r.reviewDate DESC";

		try (
				Connection con = getConnection();

				PreparedStatement st =
						con.prepareStatement(sql)
				) {

			st.setInt(1, mediaCode);

			try (ResultSet rs = st.executeQuery()) {

				while (rs.next()) {

					Review review = new Review();

					review.setReviewCode(
							rs.getInt("reviewCode"));

					review.setReview(
							rs.getString("review"));

					review.setRating(
							rs.getInt("rating"));

					review.setReviewDate(
							rs.getTimestamp("reviewDate"));

					review.setUserAccountCode(
							rs.getInt("userAccountCode"));

					review.setMediaCode(
							rs.getInt("mediaCode"));

					review.setUserName(
							rs.getString("userName"));

					review.setTitle(
							rs.getString("title"));

					list.add(review);
					System.out.println(list); //デバッグ用
				}
			}
		}

		return list;
	}

	//会員がマイページで自身のレビューを一覧表示するためのメソッド
	public List<Review> myReview(int userAccountCode) throws  Exception {
		List<Review> list = new ArrayList<>(); 
		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT r.reviewCode,"
								+ " r.review,"
								+ " r.rating,"
								+ " r.reviewDate,"
								+ " r.reviewDelete,"
								+ " r.userAccountCode,"
								+ " r.mediaCode,"
								+ " m.title "
								+ "FROM review r "
								+ "JOIN media m "
								+ "ON r.mediaCode = m.mediaCode "
								+ "WHERE r.userAccountCode = ? "
								+ "AND r.reviewDelete = 0 "
								+ "ORDER BY r.reviewDate DESC")) 
		{ st.setInt(1, userAccountCode); 
		try (ResultSet rs = st.executeQuery()) 
		{ while (rs.next()) { Review review = new Review(); 
		review.setReviewCode(rs.getInt("reviewCode"));
		review.setReview(rs.getString("review"));
		review.setRating(rs.getInt("rating"));
		review.setReviewDate(rs.getTimestamp("reviewDate"));
		review.setReviewDelete(rs.getInt("reviewDelete"));
		review.setUserAccountCode( rs.getInt("userAccountCode")); 
		review.setMediaCode(rs.getInt("mediaCode")); 
		review.setTitle(rs.getString("title"));
		list.add(review);
		} 
		} 
		}
		return list; 
	}

	//レビューの削除フラグを更新する際に使用、更新に成功した行数を返す
	public int reviewDelete(
			int reviewCode,
			int userAccountCode) throws Exception {

		int line = 0;

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"UPDATE review "
								+ "SET reviewDelete = 1 "
								+ "WHERE reviewCode = ? "
								+ "AND userAccountCode = ? "
								+ "AND reviewDelete = 0")) {

			st.setInt(1, reviewCode);
			st.setInt(2, userAccountCode);

			line = st.executeUpdate();
		}

		return line;
	}

	public int reviewInsert(Review review) throws Exception{
		int line = 0;

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"INSERT INTO review(review,rating, userAccountCode, mediaCode) VALUES(?,?,?,?)")) {

			st.setString(1, review.getReview());
			st.setInt(2, review.getRating());
			st.setInt(3, review.getUserAccountCode());
			st.setInt(4, review.getMediaCode());

			line = st.executeUpdate();
		}

		return line;
	}


	//レビューを削除する前に、該当レビューが存在するかを確認するメソッド
	public Review reviewCheck(
			int reviewCode,
			int userAccountCode) throws Exception {

		Review review = null;

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT r.reviewCode, "
								+ "r.review, "
								+ "r.rating, "
								+ "r.reviewDate, "
								+ "r.reviewDelete, "
								+ "r.userAccountCode, "
								+ "r.mediaCode, "
								+ "m.title "
								+ "FROM review r "
								+ "JOIN media m "
								+ "ON r.mediaCode = m.mediaCode "
								+ "WHERE r.reviewCode = ? "
								+ "AND r.userAccountCode = ? "
								+ "AND r.reviewDelete = 0")) {

			st.setInt(1, reviewCode);
			st.setInt(2, userAccountCode);

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {

					review = new Review();

					review.setReviewCode(
							rs.getInt("reviewCode"));

					review.setReview(
							rs.getString("review"));

					review.setRating(
							rs.getInt("rating"));

					review.setReviewDate(
							rs.getTimestamp("reviewDate"));

					review.setReviewDelete(
							rs.getInt("reviewDelete"));

					review.setUserAccountCode(
							rs.getInt("userAccountCode"));

					review.setMediaCode(
							rs.getInt("mediaCode"));

					review.setTitle(
							rs.getString("title"));
				}
			}
		}

		return review;
	}

	// 管理者がレビューを削除する前に、
	// reviewCodeから該当レビューを取得する
	public Review adminReviewCheck(int reviewCode)
			throws Exception {

		Review review = null;

		String sql =
				"SELECT "
						+ "r.reviewCode, "
						+ "r.review, "
						+ "r.reviewDate, "
						+ "r.reviewDelete, "
						+ "r.userAccountCode, "
						+ "r.mediaCode, "
						+ "m.title "
						+ "FROM review r "
						+ "JOIN media m "
						+ "ON r.mediaCode = m.mediaCode "
						+ "WHERE r.reviewCode = ? "
						+ "AND r.reviewDelete = 0";

		try (
				Connection con = getConnection();

				PreparedStatement st =
						con.prepareStatement(sql)
				) {

			st.setInt(1, reviewCode);

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {

					review = new Review();

					review.setReviewCode(
							rs.getInt("reviewCode"));

					review.setReview(
							rs.getString("review"));

					review.setReviewDate(
							rs.getTimestamp("reviewDate"));

					review.setReviewDelete(
							rs.getInt("reviewDelete"));

					review.setUserAccountCode(
							rs.getInt("userAccountCode"));

					review.setMediaCode(
							rs.getInt("mediaCode"));

					review.setTitle(
							rs.getString("title"));
				}
			}
		}

		return review;
	}
	//管理者がレビューを論理削除するメソッド
	public int adminReviewDelete(int reviewCode)
			throws Exception {

		int line = 0;

		try (
				Connection con = getConnection();

				PreparedStatement st =
						con.prepareStatement(
								"UPDATE review "
										+ "SET reviewDelete = 1 "
										+ "WHERE reviewCode = ? "
										+ "AND reviewDelete = 0")
				) {

			st.setInt(1, reviewCode);

			line = st.executeUpdate();
		}

		return line;
	}
	//すでにレビュー投稿済みか確認するDAO
	public boolean reviewExists(int userAccountCode, int mediaCode)
			throws Exception {

		String sql =
				"SELECT COUNT(*) "
						+ "FROM review "
						+ "WHERE userAccountCode = ? "
						+ "AND mediaCode = ? "
						+ "AND reviewDelete = 0";

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)) {

			st.setInt(1, userAccountCode);
			st.setInt(2, mediaCode);

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		}

		return false;
	}

}
