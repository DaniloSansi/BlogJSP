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
	<form action="insertcategory" method="post">
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
			<p class="h1 mb-4">Create category</p>
			<div class="form-row">
				<div class="form-group col-md-5">
					<label for="inputTitle">Category title</label> <input autocomplete="off"
						class="form-control" type="text" name="cat_title" size="45"
						required value="<c:out value='${category.getCat_title()}' />" />
					<button onClick="goback()" class="btn btn-primary mt-3">Go
						Back</button>
					<button type="submit" class="btn btn-primary mt-3">Save</button>
				</div>
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-5">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">
							All categories </a>

						<c:forEach items="${result.rows}" var="res">
							 <a href="#" name="id" id="id" class="list-group-item list-group-item-action"> ${res.cat_title} </a>
						</c:forEach>
	
					</div>
				</div>
			</div>


		</div>

	</form>

</body>
<script>
	function goback() {
		window.open("blog", "_self");
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