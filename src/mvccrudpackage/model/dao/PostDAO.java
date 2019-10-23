package mvccrudpackage.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import mvccrudpackage.model.bean.Category;
import mvccrudpackage.model.bean.Post;

public class PostDAO {
//Define instance variables
	private String DBURL = "jdbc:mysql://localhost:3306/BLOG";
	private String DBUsername = "root";
	private String DBPassword = "B4nc0S1stem4";
	private String INSERTEMPSQL = "INSERT INTO POST (cat_id,post_title,post_keywords,post_body,published )VALUES " + " (?, ?, ?, ?, ?);";
	private String INSERTEMCATPSQL = "INSERT INTO CATEGORY (cat_title)VALUES " + " (?);";
	private String SELECTEMPID = "select post_id, cat_id, post_title, post_keywords, post_body, published , created_at from POST where post_id =?";
	private String SELECTCATID = "select cat_id,cat_title from category where cat_id =?";
	private String SELECTALLPOSTS = "select p.post_id, p.cat_id, p.post_title, p.post_keywords, p.post_body, p.published,c.cat_title, p.created_at"+
	                                " from POST p INNER JOIN CATEGORY c ON p.cat_id = c.cat_id order by p.post_id";
	private String SELECTALLCATEGORIES = "select * from category";
	private String DELETEEMPSQL = "delete from POST where post_id =?;";
	private String UPDATEEMPSQL = "update POST set cat_id = ?, post_title = ?, post_keywords = ?, post_body = ?, published = ? where post_id = ?";

	// constructor
	public PostDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DBURL, DBUsername, DBPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertPost(Post post) throws SQLException {
		System.out.println(INSERTEMPSQL);
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// try-with-resource statement will auto close the connection.
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(INSERTEMPSQL);
			preparedStatement.setInt(1, post.getCat_id());
			preparedStatement.setString(2, post.getPost_title());
			preparedStatement.setString(3, post.getPost_keywords());
			preparedStatement.setString(4, post.getPost_body());
			preparedStatement.setInt(5, post.getPublished());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, null);
		}
	}
	
	public void insertCategory(Category category) throws SQLException {
		System.out.println(INSERTEMCATPSQL);
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// try-with-resource statement will auto close the connection.
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(INSERTEMCATPSQL);
			preparedStatement.setString(1, category.getCat_title());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, null);
		}
	}


	public Post selectPost(int Eid) {
		Post post = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		// Step 1: Establishing a Connection
		try {
			connection = getConnection();
			// Step 2:Create a statement using connection object
			
			preparedStatement = connection.prepareStatement(SELECTEMPID);
			preparedStatement.setInt(1, Eid);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int Post_id = rs.getInt("post_id");
				int Cat_id = rs.getInt("cat_id");
				String Post_title = rs.getString("post_title");
				String Post_keywords = rs.getString("post_keywords");
				String Post_body = rs.getString("post_body");
				int Published = rs.getInt("published");
				Date Created_at = rs.getDate("created_at");
				
				post = new Post(Post_id, Cat_id, Post_title, Post_keywords, Post_body ,Published , Created_at );
			}
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, rs);
		}
		return post;
	}

	public Category selectCategory(int Eid) {
		Category category = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		// Step 1: Establishing a Connection
		try {
			connection = getConnection();
			// Step 2:Create a statement using connection object
			preparedStatement = connection.prepareStatement(SELECTCATID);
			preparedStatement.setInt(1, Eid);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int cat_id = rs.getInt("cat_id");
				String cat_title = rs.getString("cat_title");
				
				category = new Category(cat_id, cat_title );
			}
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, rs);
		}
		return category;
	}
	
	public List<Post> selectAllPosts() {
	    //Post emp = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		// using try-with-resources to avoid closing resources (boilerplate code)
		List<Post> posts = new ArrayList<>();
		// Step 1: Establishing a Connection
		try {
			connection = getConnection();
			// Step 2:Create a statement using connection object
			preparedStatement = connection.prepareStatement(SELECTALLPOSTS);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int Post_id = rs.getInt("post_id");
				int Cat_id = rs.getInt("cat_id");
				String Post_title = rs.getString("post_title");
				String Post_keywords = rs.getString("post_keywords");
				String Post_body = rs.getString("post_body");
				int Published = rs.getInt("published");
				String Cat_title = rs.getString("cat_title");
				Date Created_at = rs.getDate("created_at");
				
				posts.add(new Post(Post_id, Cat_id, Post_title, Post_keywords, Post_body ,Published , Cat_title, Created_at ));
			}
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, rs);
		}
		return posts;
	}

	public List<Category> selectAllCategories() {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		List<Category> categories = new ArrayList<>();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(SELECTALLCATEGORIES);
			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				int Post_id = rs.getInt("cat_id");
				String Cat_id = rs.getString("cat_title");
				categories.add(new Category(Post_id, Cat_id ));
			}
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, rs);
		}
		return categories;
	}
	
	public boolean deletePost(int id) throws SQLException {
		boolean postDeleted = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(DELETEEMPSQL);
			preparedStatement.setInt(1, id);
			postDeleted = preparedStatement.executeUpdate() > 0 ? true : false;
		} finally {
			finallySQLException(connection, preparedStatement, null);
		}
		return postDeleted;
	}

	public boolean updatePost(Post post) throws SQLException {
		boolean postUpdated = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(UPDATEEMPSQL);
			preparedStatement.setInt(1, post.getCat_id());
			preparedStatement.setString(2, post.getPost_title());
			preparedStatement.setString(3, post.getPost_keywords());
			preparedStatement.setString(4, post.getPost_body());
			preparedStatement.setInt(5, post.getPublished());
			preparedStatement.setInt(6, post.getPost_id());
	
			postUpdated = preparedStatement.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			printSQLException(e);
		} finally {
			finallySQLException(connection, preparedStatement, null);
		}
		return postUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	private void finallySQLException(Connection c, PreparedStatement p, ResultSet r) {
		if (r != null) {
			try {
				r.close();
			} catch (Exception e) {
			}
			r = null;
		}
		if (p != null) {
			try {
				p.close();
			} catch (Exception e) {
			}
			p = null;
		}
		if (c != null) {
			try {
				c.close();
			} catch (Exception e) {
				c = null;
			}
		}
	}
}