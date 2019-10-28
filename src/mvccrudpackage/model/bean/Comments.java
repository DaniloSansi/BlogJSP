package mvccrudpackage.model.bean;
import java.sql.Date;

public class Comments {

	private int comments_id;
	private int post_id;
	private String comments_text;
	private Date created_at;
	
	public Comments() {
		
	}
	
	public Comments(String comments_text) {
		this.comments_text = comments_text;
	}
	
	public Comments(int post_id,String comments_text,Date created_at) {
		this.post_id = post_id;
		this.comments_text = comments_text;
		this.created_at = created_at;
	}
	
	public Comments(int post_id,String comments_text) {
		this.post_id = post_id;
		this.comments_text = comments_text;
	}

	public int getComments_id() {
		return comments_id;
	}


	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}


	public int getPost_id() {
		return post_id;
	}


	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}


	public String getComments_text() {
		return comments_text;
	}

	public void setComments_text(String comments_text) {
		this.comments_text = comments_text;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
