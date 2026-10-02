package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.Admin;

public class AdminDAO extends DAO{

	////	管理者が削除するときに一覧表示するためのメソッド
	public List<Admin> adminAllSearch()throws Exception {
		//管理者を何人文も入れられる一覧用の箱を作る
		List<Admin> adminList = new ArrayList<>();

		String sql =
				// 管理者削除画面に表示させる情報
				"SELECT adminAccountCode, adminId, adminDate, adminDelete "
				+ "FROM admin "
				// 削除されていない管理者だけを検索する
				+ "WHERE adminDelete = 0 "
				//adminAccountcode 1,  adminId test1234は表示させないようにする
				+ "and adminAccountCode > 1";


		try(
				Connection con=getConnection();
				PreparedStatement st=con.prepareStatement(sql);
				ResultSet rs = st.executeQuery()
				){
			//検索結果を一件ずつ読み込む
			while(rs.next()) {
				//一人分の管理者Beanを作成
				Admin admin = new Admin();

				admin.setAdminAccountCode( rs.getInt("adminAccountCode"));
				admin.setAdminId(rs.getString("adminId"));
				admin.setAdminDate( rs.getTimestamp("adminDate"));
				admin.setAdminDelete( rs.getInt("adminDelete"));
				adminList.add(admin);
			}
		}
		//Actionへ管理者一覧を返す
		return adminList;
	}

	public Admin adminLogin(String adminId, String adminPassword) throws SQLException, Exception {
		Admin admin = null;

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT * FROM admin WHERE BINARY adminId=? AND BINARY adminPassword=? AND adminDelete=0" )) {

			st.setString(1, adminId);
			st.setString(2, adminPassword);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				admin = new Admin();
				admin.setAdminAccountCode(rs.getInt("adminAccountCode"));
				admin.setAdminId(rs.getString("adminId"));
				admin.setAdminPassword(rs.getString("adminPassword"));
				admin.setAdminDate(rs.getTimestamp("adminDate"));
				admin.setAdminDelete(rs.getInt("adminDelete"));
				admin.setAdminSessionId(rs.getString("adminSessionId"));
			}
		}

		return admin;
	}


	public boolean adminIdCheck(String adminId) throws Exception {

		String sql = "SELECT COUNT(*) FROM admin WHERE BINARY adminId = ?";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			st.setString(1, adminId);

			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		}

		return false;
	}

	public int adminDelete(int adminAccountCode) throws Exception {

		String sql =
				"UPDATE admin "
						+ "SET adminDelete = 1, "
						+ "    adminSessionId = NULL "
						+ "WHERE adminAccountCode = ? "
						+ "AND adminDelete = 0 "
						//adminAccountcode 1,  adminId test1234は削除させないようにする
						+ "AND adminAccountCode > 1";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				//adminAccountCodeで削除・更新する
				st.setInt(1, adminAccountCode);

				int line = st.executeUpdate();
				//	            System.out.println(line); 

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

	public int adminInsert(Admin admin) throws Exception {

		String sql =
				"insert into admin(adminId, adminPassword) "
						+ "values (?, ?)";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {//トランザクション
			con.setAutoCommit(false);

			try {
				st.setString(1, admin.getAdminId());
				st.setString(2, admin.getAdminPassword());

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
				//トランザクション
				con.setAutoCommit(true);
			}
		}
	}

	public Admin adminSearch(int adminAccountCode) throws Exception {
		// TODO 自動生成されたメソッド・スタブ


		String sql =
				"SELECT * FROM admin "
						+ "WHERE adminAccountCode = ? "
						+ "AND adminDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {

			st.setInt(1, adminAccountCode);

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {

					Admin admin = new Admin();

					admin.setAdminAccountCode(rs.getInt("adminAccountCode"));
					admin.setAdminId(rs.getString("adminId"));
					admin.setAdminPassword(rs.getString("adminPassword"));
					admin.setAdminDate(rs.getTimestamp("adminDate"));
					admin.setAdminDelete(rs.getInt("adminDelete"));

					return admin;
				}
			}
		}

		return null;
	}

	//ログインする管理者の情報をもとにadminSessionIdをDBに書き込むメソッド
	public Admin adminSessionId(Admin admin) throws Exception {

		String sql = "update admin set adminSessionId = ? where adminId = ? and adminPassword = ? and adminDelete=0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				st.setString(1, admin.getAdminSessionId());
				st.setString(2, admin.getAdminId());
				st.setString(3, admin.getAdminPassword());
				int line = st.executeUpdate();

				if (line > 0) {
					con.commit();

				} else {
					con.rollback();
				}

				return admin;

			} catch (Exception e) {
				con.rollback();
				throw e;

			} finally {
				con.setAutoCommit(true);
			}



		}
	}
	public boolean adminVerification(Admin admin) throws Exception {

		String sql =
				"SELECT adminSessionId FROM admin "
						+ "WHERE adminId = ? "
						+ "AND adminDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {

			st.setString(1, admin.getAdminId());

			try (ResultSet rs = st.executeQuery()) {

				if (rs.next()) {

					String dbSessionId =
							rs.getString("adminSessionId");

					return admin.getAdminSessionId() != null
							&& admin.getAdminSessionId().equals(dbSessionId);
				}
			}
		}

		return false;
	}

	// ログアウト時にDBに保存されているセッションIDを削除する
	public int clearAdminSessionId(String adminId) throws Exception {

		String sql =
				"UPDATE admin "
						+ "SET adminSessionId = NULL "
						+ "WHERE adminId = ? "
						+ "AND adminDelete = 0";

		try (
				Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(sql)
				) {
			con.setAutoCommit(false);

			try {
				st.setString(1, adminId);

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

