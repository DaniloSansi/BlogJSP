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
<title>Blog</title>
</head>
<style>
.title {
	background-color: lightgray;
	border-radius: 5px 5px;
	font-size: 25px;
	width: 400px;
	height: 100px;
	align-items: center;
	display: flex;
	text-align: center;
	padding-left: 70px;
}

.boxMenu {
	
}
</style>
<body
	style="background-image: url('https://wallpaperplay.com/walls/full/a/3/0/71487.jpg'); background-size: 100%;">
	<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/emp" user="root"
		password="B4nc0S1stem4" />

	<c:set var="vusername" scope="session" value="${param.username}" />
	<c:set var="vpassword" scope="session" value="${param.password}" />

	<sql:query dataSource="${snapshot}" var="result">
	select count(*) as count, name from Login
	 where username = ? and password = ? 
	 <sql:param value="${vusername}" />
		<sql:param value="${vpassword}" />
	</sql:query>

	<c:forEach items="${result.rows}" var="res">
		<c:choose>
			<c:when test="${res.count > 0}">

				<form name="frmLogged" action="blog" method="post">
					<script>
					   <c:set var = "username" scope ="session" value="${res.name}"/>
					   frmLogged.submit();
					</script>
				</form>
			</c:when>
			<c:otherwise>
				<c:set var = "username" scope ="session" value=""/>
				<center>
					<p class="title">
						<c:out value="Username/password invalid" />
					</p>
				</center>
				<center>
					<p>
						<input type="button" value="Go back" onClick="goback()" />
					</p>
				</center>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</body>
<script>
	function goback() {
		window.open("Login.jsp", "_self");
	}
</script>
</html>