<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<title>Blog</title>
</head>
<style>
</style>

<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#">Blog 235</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navb" aria-expanded="true">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navb" class="navbar-collapse collapse hide">
			<ul class="nav navbar-nav ml-auto">
				<c:choose>
					<c:when test="${not empty username}">

						<li class="nav-item"><a class="nav-link" href="#">${username}</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onClick="LogOut()"><span class="fas fa-sign-out-alt"></span>
								Logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="#"
							onClick="LoginPage()"><span class="fas fa-sign-in-alt"></span>
								Login</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</nav>

	<div class="jumbotron jumbotron-fluid mb-1"
		style="background-image: url('https://wallpaperplay.com/walls/full/a/3/0/71487.jpg'); background-size: 100%;">

		<div class="container text-center">
			<h1 class="display-4 text-light font-weight-bold">Blog 235</h1>
		</div>
	</div>

	<div class="justify-content-end">
		<ul class="nav nav-pills justify-content-end" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="pill" href="#home">Home</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="pill"
				href="#menu1">Post</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="pill"
				href="#menu2">About</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="pill"
				href="#menu3">Contact</a></li>
		</ul>
	</div>

	<div class="container-fluid">
		<div class="row">

			<div class="col-md-9">
				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						<br>
						<h3>Recent Posts</h3>
						<c:forEach var="post" items="${listPost}">
							<div class="divTableRow mt-5 mb-2">
								<div class="divTableCell">
									<span class="font-weight-bold">Category Title :</span> <span
										class="font-weight-bold text-info"><c:out
											value="${post.getCat_title()}" /></span>

								</div>
								<div class="divTableCell">
									<span class="font-weight-bold">Post Title : </span>
									<c:out value="${post.getPost_title()}" />
								</div>
								<div class="divTableCell">
									<span class="font-weight-bold"> Created at : </span>
									<c:out value="${post.getCreated_at()}" />
								</div>
								<div class="divTableCell">
									<c:out value="${post.getPost_body()}" />

								</div>
							</div>

							<div class=" ml-1">
								<button class="btn btn-outline-secondary" data-toggle="collapse"
									data-target="#demo${post.getPost_id()}">
									<span class="font-weight-bold">Comments
										(${post.getComments().size()})</span>
								</button>

								<div id="demo${post.getPost_id()}" class="collapse mt-2">
									<c:forEach var="comments" items="${post.getComments()}">
										<div class="divTableRow">
											<span class="font-weight-bold">${comments.getCreated_at()}
												: </span> <span class="font-weight-regular"><c:out
													value="${comments.getComments_text()}" /></span>
										</div>
									</c:forEach>
								</div>


								<form name="frmAddComment" action="insertcomment" method="post">
									<div class="input-group mt-2">
										<input type="hidden" name="post_id"
											value="<c:out value='${post.getPost_id()}' />" /> <input
											type="text" class="form-control" id="comment" name="comment"
											placeholder="Add a comment">
										<div class="input-group-prepend">

											<button type="submit" class="btn btn-outline-secondary">
												<i class="fas fa-plus-circle"></i>
											</button>
										</div>
									</div>
								</form>
							</div>

							<div class="row">
								<c:choose>
									<c:when test="${not empty username}">
										<form name="frmEditPost" action="edit" method="post">
											<input type="hidden" name="id"
												value="<c:out value='${post.getPost_id()}' />" />
											<button type="submit"
												class="btn btn-outline-info btn-sm mt-2 ml-3">
												<span class="fas fa-edit"></span> Edit Post
											</button>

										</form>
										<form name="frmDeletePost" action="delete" method="post">
											<input type="hidden" name="id"
												value="<c:out value='${post.getPost_id()}' />" />
											<button type="submit"
												class="btn btn-outline-danger btn-sm mt-2 ml-2">
												<span class="fas fa-ban"></span> Delete Post
											</button>
										</form>
									</c:when>
								</c:choose>
							</div>

							<p />
						</c:forEach>
					</div>
					<div id="menu1" class="container tab-pane fade">
						<br>
						<h3>Posts</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
							laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<div id="menu2" class="container tab-pane fade">
						<br>
						<h3>About</h3>
						<p>This is a blog created by students of BIT235 second
							semester of 2019. The purpose of this blog is to apply the
							knowledge acquired in class. It was used Java to handle the
							back-end, bootstrap 4 and HTML/CSS/Javascript to handle the
							front-end. Mysql is the database used to store all information
							displayed on this page.</p>
						<p>Here we show the competence and ability to build a web
							application. From now on, we're able to take clients'
							requirements and build a software architecture and delivery a
							fully functional online solution.</p>
						<p>If any interest or website proposal, please contact us on
							s1484814@student.mp.edu.au / s1465063@student.mp.edu.au /
							t.weerathunga93@yahoo.com.</p>

						<span class="font-weight-bold"><p>Thank you!</p></span> 

					</div>
					<div id="menu3" class="container tab-pane fade">
						<br>
						<h3>Contact Us</h3>
						<p>
							<b>Postal Address:</b>144 High St, Prahran VIC 3181
						</p>
						<p>
							<b>Email :</b>s1484814@student.mp.edu.au /
							s1465063@student.mp.edu.au
						</p>
						<p>
							<b>Telephone:</b>03466564545
						</p>
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d18080.264128955976!2d144.99415863009477!3d-37.85218117112083!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad66823873270b5%3A0x5045675218ce8e0!2sPrahran%20VIC%203181!5e0!3m2!1sen!2sau!4v1571807662891!5m2!1sen!2sau"
							width="600" height="450" frameborder="0" style="border: 0;"
							allowfullscreen=""></iframe>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card bg-light mt-3" style="max-width: 18rem;">
					<form name="frmSearch" action="search" method="post">
						<div class="card-body ">
							<div class="input-group mb-2">
								<input type="text" class="form-control"
									id="inlineFormInputGroup" name="search" placeholder="Search">
								<div class="input-group-prepend">
									<button type="submit" class="btn btn-info">
										<i class="fas fa-search"></i>
									</button>
								</div>

							</div>
							<p class="card-text">This is a blog for discussing web
								development</p>

						</div>
					</form>

				</div>

				<c:choose>
					<c:when test="${not empty username}">
						<div class="card bg-light mt-3" style="max-width: 18rem;">

							<div class="card-body ">
								<div class="input-group mb-2">
									<button type="button" onClick="Post()"
										class="btn btn-info btn-lg btn-block">Create New Post</button>
									<button type="button" onClick="Category()"
										class="btn btn-info btn-lg btn-block">Create New
										Category</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Edit
										Contact</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Edit
										About</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Old
										Post List</button>
									<button type="button" onClick="LogOut()"
										class="btn btn-info btn-lg btn-block">LogOut</button>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>

			</div>
		</div>
	</div>
	<!--   <div class="menu-box">
    <a href="#about">Contact</a>
    <a href="#contact">About</a>
    <a href="#news">Post</a>
	<a class="active" href="#home">Home</a>
  </div> -->

</body>

<script>
	function LoginPage() {
		window.open("Login.jsp", "_self");
	}

	function LogOut() {
		window.open("LogOut.jsp", "_self");
	}

	function Post() {
		window.open("Post.jsp", "_self");
	}

	function Category() {
		window.open("Category.jsp", "_self");
	}
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js">
<!-- Optional JavaScript bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</html>