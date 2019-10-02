<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog</title> 
</head>
<style>

/*body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}*/

.header{
	height:100px;
	width:auto;
	background-color: #4F78C0;
	border-radius:10px;
	
	display: flex;
	justify-content: center; /* align horizontal */
	align-items: center; /* align vertical */

}

.menu-box {
  background-color: white;
  margin-top: 5px;
}

.menu-box a{
  float: right;
  color: #4F78C0;
  text-align: center;
  padding: 10px 10px;
  text-decoration: none;
  font-size: 20px;

}

.menu-box a:hover {
  background-color: #ddd;
  color: black;
}

.menu-box a.active {
  background-color: #4F78C0;
  color: white;
}

.body-page{
  position: fixed;
  overflow-x: hidden;
  padding-top: 20px;
}

.split-left {

  width: 70%;
  margin-top:55px;
  left: 0;
  background-color: gray;
}

.split-right {
  height: 100%;
  width: 30%;
  margin-top:55px;
  right: 0;
  background-color: lightgrey;
}

.centered {
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}


</style>

<body>

  <div class="header">
   		<h1>Z Blog</h1>
  </div>
  
  <div class="menu-box">
    <a href="#about">Contact</a>
    <a href="#contact">About</a>
    <a href="#news">Post</a>
	<a class="active" href="#home">Home</a>
  </div>
  
	<div class="body-page split-left">
	  <div class="">
	    <h2>Recent posts</h2>
	    
			<c:forEach var="post" items="${listPost}">
				<div class="divTableRow">
					<div class="divTableCell">Category Title : <c:out value="${post.getCat_title()}" /></div>
					<div class="divTableCell"><c:out value="${post.getPost_title()}" /></div>
					<div class="divTableCell"><c:out value="${post.getPost_body()}" /></div>	
				</div>
			
			</c:forEach>
			
	  </div>
	</div>
	
	<div class="body-page split-right">
	  <div class="centered">
	    <p><input type="text" placeholder="search in the blog"></input><input type="button"></input> </p>
	    <p>This is a blog for discussing web development</p>
	  </div>
	</div>


</body>
<script>

 
</script>
</html>