package Bean;

import java.sql.Timestamp;

public class User {

	private int userAccountCode;

	private String userId;

	private String userPassword;

	private String userName;

	private Timestamp userDate;

	private int userDelete;
	
	private String userSessionId;
	

	
	public String getUserSessionId() {
		return userSessionId;
	}

	public void setUserSessionId(String userSessionId) {
		this.userSessionId = userSessionId;
	}

	public int getUserDelete() {
		return userDelete;
	}

	public int getUserAccountCode() {
		return userAccountCode;
	}

	public void setUserAccountCode(int userAccountCode) {
		this.userAccountCode = userAccountCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Timestamp getUserDate() {
		return userDate;
	}

	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}

	public int isUserDelete() {
		return userDelete;
	}

	public void setUserDelete(int userDelete) {
		this.userDelete = userDelete;
	}

	@Override
	public String toString() {
		return "User [userAccountCode=" + userAccountCode + ", userId=" + userId + ", userPassword=" + userPassword
				+ ", userName=" + userName + ", userDate=" + userDate + ", userDelete=" + userDelete
				+ ", userSessionId=" + userSessionId + "]";
	}

}
