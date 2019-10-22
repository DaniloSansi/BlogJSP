package mvccrudpackage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvccrudpackage.model.bean.Category;
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
			case "/delete":
				deletePost(request, response);
				break;
			case "/edit":
				showEditPost(request, response);
				break;
			case "/update":
				updatePost(request, response);
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
		request.setAttribute("listPost", listPost);
		RequestDispatcher dispatcher = request.getRequestDispatcher("blog.jsp");
		dispatcher.forward(request, response);
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
		

		System.out.println("epostbody"+epostbody);
		
		Post e = new Post(-1,ecat_id,epost_title,epost_keywords,epostbody,epublished,epost_title);
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

	private void showEditPost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Post existingPost = empDAO.selectPost(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("postform.jsp");
		request.setAttribute("post", existingPost);
		dispatcher.forward(request, response);
	}

	private void updatePost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String ename = request.getParameter("name");
		int eage = Integer.parseInt(request.getParameter("age"));

		//Post e = new Post(id, ename, eage);
		//empDAO.updatePost(e);
		response.sendRedirect("list");
	}

	private void deletePost(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		empDAO.deletePost(id);
		response.sendRedirect("list");
	}

}
