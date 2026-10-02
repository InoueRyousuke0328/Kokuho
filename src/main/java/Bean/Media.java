package Bean;

public class Media {

	private int mediaCode;

	private String title;

	private String information;

	private String type;

	private String releaseDate ;

	private String picture;
	
	private String genre;
	
	private double averageRating;
	
	private int reviewCount;
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	private int mediaDelete;

	public int getMediaCode() {
		return mediaCode;
	}

	public void setMediaCode(int mediaCode) {
		this.mediaCode = mediaCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getMediaDelete() {
		return mediaDelete;
	}

	public void setMediaDelete(int mediaDelete) {
		this.mediaDelete = mediaDelete;
	}
	
	

	@Override
	public String toString() {
		return "Media [mediaCode=" + mediaCode + ", title=" + title + ", information=" + information + ", type=" + type
				+ ", releaseDate=" + releaseDate + ", picture=" + picture + ", mediaDelete=" + mediaDelete + "]";
	}
	
	//レビューの平均値
	public double getAverageRating() {
	    return averageRating;
	}

	public void setAverageRating(double averageRating) {
	    this.averageRating = averageRating;
	}

	//平均評価を四捨五入して整数で返す
	public int getRoundedAverageRating() {
	    return (int)Math.round(averageRating);
	}
	
	public int getReviewCount() {
	    return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
	    this.reviewCount = reviewCount;
	}
	
}
