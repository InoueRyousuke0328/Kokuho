package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.User;

public class UserDAO extends DAO {

	//	管理者が削除するときに一覧表示するためのメソッド
	public List<User> userAllSearch() throws Exception {

		// 会員を複数格納する一覧用の箱
		List<User> userList = new ArrayList<>();

		String sql =
				"SELECT userAccountCode, userId, userName, userDelete "
						+ "FROM user "
						+ "WHERE userDelete = 0";
		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery()
				) {
			// 検索結果を1件ずつ読み込む
			while (rs.next()) {

				// 1人分の会員Beanを作成
				User user = new User();

				user.setUserAccountCode(rs.getInt("userAccountCode"));
				user.setUserId( rs.getString("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserDelete( rs.getInt("userDelete"));
				userList.add(user);
			}
		}
		// Actionへ会員一覧を返す
		return userList;
	}

	// 会員本人の退会・管理者による会員削除で共通使用
	// userDeleteを0から1へ更新し、更新行数を返す
	//会員削除と管理者からの会員削除をつかいまわす。
	public int userDelete(int userAccountCode) throws Exception {

		String sql =
				"UPDATE user "
						+ "SET userDelete = 1, "
						+ "    userName = '退会済みアカウント', "
						+ "    userSessionId = NULL "
						//どのユーザーを更新するかを指定
						+ "WHERE userAccountCode = ? "
						//退会済みの会員をもう一度更新できないようにする
						+ "AND userDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				st.setInt(1, userAccountCode);

				int line = st.executeUpdate();

				if (line > 0) {
					con.commit();
				} else {
					con.rollback();
				}

				return line;

			} catch (Exception e) {
				con.rollback();
				throw e;

			} finally {
				con.setAutoCommit(true);
			}
		}
	}


	//	会員がログインする時にDBのUserAccountテーブルを検索するためのメソッド

	// テスト用
	public User userLogin(String userId, String userPassword) throws Exception {
		User user = null;

		try (Connection con = getConnection();

				PreparedStatement st = con.prepareStatement("select * from user where BINARY userId = ? and BINARY userPassword = ?and userDelete=0");
				){
			st.setString(1, userId);
			st.setString(2, userPassword);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setUserId(rs.getString("userId"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserAccountCode(rs.getInt("userAccountCode"));
				user.setUserName(rs.getString("userName"));
				user.setUserDate(rs.getTimestamp("userDate"));
				user.setUserSessionId(rs.getString("userSessionId"));
			}

			return user;
		}


	}
	//DAOにDBの確認をお願いする
	public boolean userIdCheck(String userId) throws Exception {

		String sql = "SELECT COUNT(*) FROM user WHERE BINARY userId = ?";

		try (
				//DBへ接続する
				Connection con = getConnection();
				//SQLを準備
				PreparedStatement st = con.prepareStatement(sql)
				) {
			st.setString(1, userId);
			//SQLを実行しDBへ送信される、Bから結果が帰ってくる
			//結果がResultSetにはいる。
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					//1>0:true
					//0>0:false
					return rs.getInt(1) > 0;
				}
			}
		}
		//もし何らかの理由で結果が取得できなかった場合の保険
		return false;
	}

	public int userInsert(User user) throws Exception {
		//DBへ新しいユーザーを追加するSQL（?,?,?の中にフォームで入れた値を入れる）
		String sql =
				"insert into user(userId, userPassword, userName,userDelete)"
						+ "values(?, ?, ?,0)";

		try (
				//DBと接続を作る
				Connection con = getConnection();
				//SQLの実行
				PreparedStatement st = con.prepareStatement(sql)
				) {
			//commitで確定またはrollbackで取り消し
			con.setAutoCommit(false);
			//userから値を取り出してserInsertAction.javaの？にあたいを入れる
			//Beanの中に入っているあたいを取り出している
			try {
				st.setString(1, user.getUserId());
				st.setString(2, user.getUserPassword());
				st.setString(3, user.getUserName());
				//ここで初めてSQLがDBへ送られる
				int line = st.executeUpdate();
				//成功したらcommit,失敗したらrollback
				if (line > 0) {
					con.commit();
				} else {
					con.rollback();
				}
				//登録件数をactionへ返す
				//DAOからActionへ返す
				//Actionではint result=dao.userInsert(user);で受け取っている	           
				return line;

				//エラーが発生した場合、登録の取り消し
			} catch (Exception e) {
				con.rollback();
				throw e;

			} finally {
				con.setAutoCommit(true);
			}
		}
	}

	public User userSearch(int userAccountCode)throws Exception{
		String sql =
				"SELECT * FROM user "
						+ "WHERE userAccountCode = ? "
						+ "AND userDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {

			st.setInt(1, userAccountCode);

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {

					User user = new User();

					user.setUserAccountCode(rs.getInt("userAccountCode"));
					user.setUserId(rs.getString("userId"));
					user.setUserPassword(rs.getString("userPassword"));
					user.setUserName(rs.getString("userName"));
					user.setUserDate(rs.getTimestamp("userDate"));
					user.setUserDelete(rs.getInt("userDelete"));

					return user;
				}
			}
		}
		return null;
	}

	//ログインするユーザーの情報をもとにuserSessionIdをDBに書き込むメソッド
	public User userSessionId(User user) throws Exception {

		String sql = "update user set userSessionId = ? where userId = ? and userPassword = ? and userDelete=0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				st.setString(1, user.getUserSessionId());
				st.setString(2, user.getUserId());
				st.setString(3, user.getUserPassword());
				int line = st.executeUpdate();

				if (line > 0) {
					con.commit();

				} else {
					con.rollback();
				}

				return user;

			} catch (Exception e) {
				con.rollback();
				throw e;

			} finally {
				con.setAutoCommit(true);
			}



		}
	}

	//ログインセッションに保存されている情報と、ログイン時にDBに保存した情報とを照合する
	public boolean userVerification(User user) throws Exception {

	    String sql =
	            "SELECT userSessionId FROM user "
	          + "WHERE userId = ? "
	          + "AND userDelete = 0";

	    try (
	        Connection con = getConnection();
	        PreparedStatement st = con.prepareStatement(sql)
	    ) {

	        st.setString(1, user.getUserId());

	        try (ResultSet rs = st.executeQuery()) {

	            if (rs.next()) {

	                String dbSessionId =
	                        rs.getString("userSessionId");

	                return user.getUserSessionId() != null
	                        && user.getUserSessionId().equals(dbSessionId);
	            }
	        }
	    }

	    return false;
	}
	
	// ログアウト時にDBに保存されているセッションIDを削除する
	public int clearUserSessionId(String userId) throws Exception {

		String sql =
				"UPDATE user "
						+ "SET userSessionId = NULL "
						+ "WHERE userId = ? "
						+ "AND userDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				st.setString(1, userId);

				int line = st.executeUpdate();

				if (line > 0) {
					con.commit();
				} else {
					con.rollback();
				}

				return line;

			} catch (Exception e) {
				con.rollback();
				throw e;

			} finally {
				con.setAutoCommit(true);
			}
		}
	}

}
