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
				href="#menu2">Contact</a></li>
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
							<div class="divTableRow">
								<div class="divTableCell">
									<span class="font-weight-bold">Category Title :</span> <span
										class="font-weight-bold text-info"><c:out
											value="${post.getCat_title()}" /></span>
								</div>
								<div class="divTableCell">
									<span class="font-weight-bold">Post Title : </span><c:out value="${post.getPost_title()}" />
								</div>
								<div class="divTableCell">
									<c:out value="${post.getPost_body()}" />
								</div>
							</div>
							<p/>
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
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card bg-light mt-3" style="max-width: 18rem;">

					<div class="card-body ">
						<div class="input-group mb-2">
							<input type="text" class="form-control" id="inlineFormInputGroup"
								placeholder="Search">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-info">
									<i class="fas fa-search"></i>
								</button>
							</div>

						</div>
						<p class="card-text">This is a blog for discussing web
							debelopment</p>

					</div>
				</div>

				<c:choose>
					<c:when test="${not empty username}">
						<div class="card bg-light mt-3" style="max-width: 18rem;">

							<div class="card-body ">
								<div class="input-group mb-2">
									<button type="button" onClick="Post()" class="btn btn-info btn-lg btn-block">Create
										New Post</button>
									<button type="button" onClick="Category()" class="btn btn-info btn-lg btn-block">Create
										New Category</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Edit
										Contact</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Edit
										About</button>
									<button type="button" class="btn btn-info btn-lg btn-block">Old
										Post List</button>
									<button type="button" class="btn btn-info btn-lg btn-block">LogOut</button>
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
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</html>