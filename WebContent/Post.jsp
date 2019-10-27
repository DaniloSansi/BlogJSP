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
	<c:if test="${post == null}">
			<form name="frmPost" action="insert" method="post">
	</c:if>
	<c:if test="${post != null}">
			<form name="frmPost" action="update" method="post">
	</c:if>
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
			<span class="h2 mb-4">Edit post <span
				class="font-weight-bold text-info">${post.getPost_title()}</span>
			</span>
			<div class="form-row mt-4">
				<div class="form-group col-md-3">
					<label for="inputState">Category</label> <select id="idcategory"
						name="category" class="form-control">
						<c:forEach items="${result.rows}" var="res">
							<option value="${res.cat_id}"
								${param.category == "${res.cat_id}" ? "selected" : ''}>${res.cat_title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="inputTitle">Post title</label> <input id="inputTitle"
						autocomplete="off" class="form-control" type="text"
						name="post_title" size="45" placeholder="Title" required
						value="<c:out value='${post.getPost_title()}' />" />

				</div>
				<div class="form-group col-md-3">
					<label for="inputkeywords">Post key words</label> <input
						id="inputkeywords" autocomplete="off" class="form-control"
						type="text" name="post_keywords" size="45" placeholder="key words"
						required value="<c:out value='${post.getPost_keywords()}' />" />
				</div>
				<div class="form-group col-md-3">
					<label for="published">Published version</label> <input
						id="inputpublished" autocomplete="off" oninput="checkPublished()"
						class="form-control" type="text" name="published" size="45"
						placeholder="Published" required
						value="<c:out value='${post.getPublished()}' />" />
				</div>
			</div>
			<div class="form-group">
				<label for="postbody">Post body</label>
				<textarea class="form-control" id="idpostbody" name="postbody"
					rows="3"><c:out value='${post.getPost_body()}' />
				</textarea>
			</div>

			<button class="btn btn-primary" onClick="goback()">Go Back</button>
			<button type="submit" class="btn btn-primary">Save</button>
		</div>

	</form>

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
	//<option selected>Choose...</option>
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