package Bean;

import java.sql.Timestamp;

public class Admin {

	private String adminId;

	private int adminAccountCode;

	private String adminPassword;

	private Timestamp adminDate;

	private int adminDelete;
	
	private String adminSessionId;
	

	public String getAdminSessionId() {
		return adminSessionId;
	}

	public void setAdminSessionId(String adminSessionId) {
		this.adminSessionId = adminSessionId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getAdminAccountCode() {
		return adminAccountCode;
	}

	public void setAdminAccountCode(int adminAccountCode) {
		this.adminAccountCode = adminAccountCode;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public Timestamp getAdminDate() {
		return adminDate;
	}

	public void setAdminDate(Timestamp adminDate) {
		this.adminDate = adminDate;
	}

	public int getAdminDelete() {
		return adminDelete;
	}

	public void setAdminDelete(int adminDelete) {
		this.adminDelete = adminDelete;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminAccountCode=" + adminAccountCode + ", adminPassword="
				+ adminPassword + ", adminDate=" + adminDate + ", adminDelete=" + adminDelete + "]";
	}

}
