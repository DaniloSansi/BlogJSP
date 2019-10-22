<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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

<title>Post management</title>
</head>
<body>
	<form action="insert" method="post">
		<div class="jumbotron jumbotron-fluid mb-1"
			style="background-image: url('https://wallpaperplay.com/walls/full/a/3/0/71487.jpg'); background-size: 100%;">

			<div class="container text-center">
				<h1 class="display-4 text-light font-weight-bold">Blog 235</h1>
			</div>
		</div>

		<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/blog" user="root"
			password="B4nc0S1stem4" />

		<sql:query dataSource="${snapshot}" var="result"> select * from category </sql:query>

		<div class="container">
			<p class="h1 mb-4">Create post</p>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="inputState">Category</label> <select id="inputState"
						class="form-control">
						<option selected>Choose...</option>
						<c:forEach items="${result.rows}" var="res">
							<option value="" >${res.cat_title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="inputTitle">Post title</label> <input id="inputTitle"
						class="form-control" type="text" name="post_title" size="45" placeholder="Title"
						required value="<c:out value='${post.getPost_title()}' />" />
					
				</div>
				<div class="form-group col-md-3">
					<label for="inputkeywords">Post key words</label> <input id="inputkeywords"
						class="form-control" type="text" name="post_keywords" size="45" placeholder="key words"
						required value="<c:out value='${post.getPost_keywords()}' />" />
					
				</div>
				<div class="form-group col-md-3">
					<label for="published">Published version</label> <input id="inputpublished"
						class="form-control" type="text" name="published" size="45" placeholder="Published"
						required value="<c:out value='${post.getPublished()}' />" />
				</div> 
			</div>
			<div class="form-group"> 
				<label for="postbody">Post body</label>
				<textarea class="form-control" id="idpostbody" name="postbody"  rows="3">
			    	
				</textarea>
			</div>

			<button onClick="goback()" class="btn btn-primary">Go Back</button>
			<button type="submit" class="btn btn-primary">Save</button>
		</div>

	</form>

</body>
<script>
	function goback() {
		console.log('going back');
		window.open("blog.jsp", "_self");
	}
</script>

<script type="text/javascript"
	src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
</script>

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