package Bean;

import java.sql.Timestamp;

public class Review {

	private int reviewCode;

	private int mediaCode;

	private int userAccountCode;

	private String review;

	private Timestamp reviewDate;
	//投稿日
	
	private int reviewDelete;

	private String title;

	private String userName;
	//ニックネーム
	
	private int rating;
	//評価
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getReviewDelete() {
		return reviewDelete;
	}

	public int getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}

	public int getMediaCode() {
		return mediaCode;
	}

	public void setMediaCode(int mediaCode) {
		this.mediaCode = mediaCode;
	}

	public int getUserAccountCode() {
		return userAccountCode;
	}

	public void setUserAccountCode(int userAccountCode) {
		this.userAccountCode = userAccountCode;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Timestamp getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Timestamp timestamp) {
		this.reviewDate = timestamp;
	}

	public int isReviewDelete() {
		return reviewDelete;
	}

	public void setReviewDelete(int reviewDelete) {
		this.reviewDelete = reviewDelete;
	}

	@Override
	public String toString() {
		return "Review [reviewCode=" + reviewCode + ", mediaCode=" + mediaCode + ", userAccountCode=" + userAccountCode
				+ ", review=" + review + ", reviewDate=" + reviewDate + ", reviewDelete=" + reviewDelete + "]";
	}

	public String getTitle() {
	    return title;
	}

	public void setTitle(String title) {
	    this.title = title;
	}

	public int getRating() {
	    return rating;
	}

	public void setRating(int rating) {
	    this.rating = rating;
	}
}
