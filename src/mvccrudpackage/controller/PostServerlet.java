package mvccrudpackage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvccrudpackage.model.bean.Category;
import mvccrudpackage.model.bean.Comments;
import mvccrudpackage.model.bean.Post;
import mvccrudpackage.model.dao.PostDAO;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class PostServerlet
 */
@WebServlet("/")
public class PostServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO empDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostServerlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() {
		empDAO = new PostDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		
		String post_id = null;
		
		if(action.indexOf("viewpost/") >= 0) {
			action = action.substring(1, action.length());	;
			post_id = action.substring(action.indexOf("/")+1, action.length());	
			action = "/viewpost";
		}
		
		try {
			switch (action) {
			case "/new":
				showNewPost(request, response);
				break;
			case "/insert":
				insertPost(request, response);
				break;
			case "/insertcategory":
				insertCategory(request, response);
				break;			
			case "/insertcomment":
				insertcomment(request, response);
				break;				
			case "/insertcommentfrompost":
				insertcommentFromPost(request, response);
				break;							
			case "/delete":
				deletePost(request, response);
				break;
			case "/edit":
				showEditPost(request, response);
				break;
			case "/viewpost":
				System.out.println("aaaaaaa");
				showViewPost(request, response, post_id);
				break;								
			case "/editcategory":
				showEditCategory(request, response);
				break;
			case "/update":
				updatePost(request, response);
				break;	
			case "/search":
				search(request, response);
				break;					
			default:
				listPost(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Post> listPost = empDAO.selectAllPosts();
		List<Post> listPostOld = empDAO.selectAllPostsOld();
		
		List<String> comments = new ArrayList<String>();
		
		for(Post post : listPost){		
			comments = getCommentsByPostId(post.getPost_id()); 
			post.setComments(empDAO.selectComments(post.getPost_id()));
		}
		
		for(Post postold : listPostOld){		
			comments = getCommentsByPostId(postold.getPost_id()); 
			postold.setComments(empDAO.selectComments(postold.getPost_id()));
		}
		
		request.setAttribute("listPost", listPost);
		request.setAttribute("listPostOld", listPostOld);
		RequestDispatcher dispatcher = request.getRequestDispatcher("blog.jsp");
		dispatcher.forward(request, response);
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		String esearch = request.getParameter("search");
		
		List<Post> listPost = empDAO.selectAllPostsSearch(esearch);
		
		List<String> comments = new ArrayList<String>();
		
		for(Post post : listPost){		
			comments = getCommentsByPostId(post.getPost_id());	
			post.setComments(empDAO.selectComments(post.getPost_id()));
		}
				
		System.out.println(listPost);
		request.setAttribute("listPost", listPost);
		RequestDispatcher dispatcher = request.getRequestDispatcher("blog.jsp");
		dispatcher.forward(request, response);
	}
	
	private List<String> getCommentsByPostId(int post_id) {

		List<Comments> listComments = empDAO.selectComments(post_id);	
		List<String> commentsString = new ArrayList<String>();
		 
		for(Comments comment : listComments){		
			commentsString.add(comment.getComments_text());
		}
		return commentsString;
	}

	private void createPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Category> listCategory = empDAO.selectAllCategories();
		request.setAttribute("listCategory", listCategory);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Post.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("postform.jsp");
		dispatcher.forward(request, response);
	}

	private void insertPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		
		int ecat_id = Integer.parseInt(request.getParameter("category"));
		String epost_title = request.getParameter("post_title");
		String epost_keywords = request.getParameter("post_keywords");
		int epublished = Integer.parseInt(request.getParameter("published"));
		String epostbody = request.getParameter("postbody");
		
		Post e = new Post(-1,ecat_id,epost_title,epost_keywords,epostbody,epublished,epost_title,null);
		empDAO.insertPost(e);
		response.sendRedirect("blog");
	}
	
	private void insertCategory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String ecat_title = request.getParameter("cat_title");
		Category e = new Category(-1,ecat_title);
		empDAO.insertCategory(e);
		response.sendRedirect("Category.jsp");
	}
	
	private void insertcomment(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
	
		int epost_id = Integer.parseInt(request.getParameter("post_id"));
		String ecomments_text = request.getParameter("comment");
		Comments e = new Comments(epost_id,ecomments_text);
		empDAO.insertComment(e);
		response.sendRedirect("blog");
	}
	
	private void insertcommentFromPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
	
		int epost_id = Integer.parseInt(request.getParameter("post_id"));
		String ecomments_text = request.getParameter("comment");
		Comments e = new Comments(epost_id,ecomments_text);
		empDAO.insertComment(e);
		
		Post existingPost = empDAO.selectPost(epost_id);
		existingPost.setComments(empDAO.selectComments(epost_id));
		
		request.setAttribute("id", epost_id);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/viewpost"); 
		request.setAttribute("post", existingPost);
		dispatcher.forward(request, response);
	}

	private void showEditPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Post existingPost = empDAO.selectPost(id);
		System.out.println("showEditPost");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Post.jsp");
		request.setAttribute("post", existingPost);
		dispatcher.forward(request, response);
	}
	
	private void showViewPost(HttpServletRequest request, HttpServletResponse response, String post_id)
			throws SQLException, ServletException, IOException {
		
		int id=0;
		
		if(post_id != null) {
			id = Integer.parseInt(post_id);
		}
		else if(request.getParameter("id") != null) {
			id= Integer.parseInt(request.getParameter("id"));
		}
		else if(request.getAttribute("id") != null ){
			id= Integer.parseInt(request.getAttribute("id").toString());
		}

		Post existingPost = empDAO.selectPost(id);
		existingPost.setComments(empDAO.selectComments(id));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewPost.jsp");
		request.setAttribute("post", existingPost);
		dispatcher.forward(request, response);
	}
	
	private void showEditCategory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Category existingCategory = empDAO.selectCategory(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
		request.setAttribute("category", existingCategory);
		dispatcher.forward(request, response);
	}

	private void updatePost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int eid = Integer.parseInt(request.getParameter("id"));
		int ecat_id = Integer.parseInt(request.getParameter("category"));
		String epost_title = request.getParameter("post_title");
		String epost_keywords = request.getParameter("post_keywords");
		int epublished = Integer.parseInt(request.getParameter("published"));
		String epostbody = request.getParameter("postbody");
		
		Post e = new Post(eid,ecat_id,epost_title,epost_keywords,epostbody,epublished,epost_title,null);
		empDAO.updatePost(e);
		response.sendRedirect("blog");
	}

	private void deletePost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		empDAO.deletePost(id);
		response.sendRedirect("blog");
	}

}
