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

	<div class="jumbotron jumbotron-fluid mb-1"
		style="background-image: url('https://wallpaperplay.com/walls/full/a/3/0/71487.jpg'); background-size: 100%;">

		<div class="container text-center">
			<h1 class="display-4 text-light font-weight-bold">Blog 235</h1>
		</div>
	</div>

	<input type="hidden" name="id"
		value="<c:out value='${post.getPost_id()}' />" />

	<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/blog" user="root"
		password="B4nc0S1stem4" />

	<sql:query dataSource="${snapshot}" var="result"> select * from category </sql:query>

	<div class="container mt-3">
		<span class=" h2 mb-4 font-weight-bold text-info">${post.getPost_title()}</span>
		<p />
		<span class="font-weight-bold">Created at : </span>
		<c:out value="${post.getCreated_at()}" />
		<p />
		<c:out value="${post.getCat_title()}" />

		<div class="form-group">
			<c:out value="${post.getPost_body()}" escapeXml="false" />
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


			<form name="frmAddComment" action="insertcommentfrompost"
				method="post">
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
		<button class="btn btn-primary mb-5 mt-2 ml-1" onClick="goback()">Go
			Back</button>
	</div>
</body>
<script>
	function goback() {
		window.open("blog", "_self");
	}

	function checkPublished() {
		var valid = true;
		var vinputpublished = document.getElementById("inputpublished");

		if (vinputpublished.value.length == 0) {
			vinputpublished.style.borderColor = "red";
			vinputpublished.style.borderWidth = "2px";
			valid = false;
		} else {

			if (isNaN(vinputpublished.value)) {
				vinputpublished.style.borderColor = "red";
				vinputpublished.style.borderWidth = "2px";
				valid = false;
			} else {
				vinputpublished.style.borderColor = "black";
				vinputpublished.style.borderWidth = "1px";
			}
		}

		return valid;
	}

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