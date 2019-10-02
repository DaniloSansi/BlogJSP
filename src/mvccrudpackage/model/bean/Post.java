package mvccrudpackage.model.bean;

import java.sql.Date;

public class Post {
	
	private int post_id;
	private int cat_id;
	private String post_title;
	private String post_keywords;
	private String post_body;
	private int published;
	private Date created_at;
	private Date updated_at;
	
	private String cat_title;
	
	
	public Post() {
		
	}
	
	public Post(int post_id, int cat_id,String post_title,String post_keywords,String post_body , int published , String cat_title) {
		this.post_id = post_id;
		this.cat_id = cat_id;
		this.post_title = post_title;
		this.post_keywords = post_keywords;
		this.setPost_body(post_body);
		this.published = published;
		this.cat_title = cat_title;
		
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_keywords() {
		return post_keywords;
	}

	public void setPost_keywords(String post_keywords) {
		this.post_keywords = post_keywords;
	}

	public int getPublished() {
		return published;
	}

	public void setPublished(int published) {
		this.published = published;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public String getPost_body() {
		return post_body;
	}

	public void setPost_body(String post_body) {
		this.post_body = post_body;
	}

	public String getCat_title() {
		return cat_title;
	}

	public void setCat_title(String cat_title) {
		this.cat_title = cat_title;
	}
	
}
