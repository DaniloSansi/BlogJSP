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
.box{
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: lightgray;
  border-width: 5px solid;
  padding: 10px;
  width: 280px;
  opacity: 0.9;
  border-radius:10px;
  
  position: fixed;
  top: 40%;
  left: 40%;
  margin-top: -100px;
}
p{
  text-align: center;
}
.class_input{
 background-color: white;
 border: 1px solid black;
 border-radius: 5px 5px;
}
.login_style{
  font-size: 25px;
}
.fieldrequired{
 color: red;
 margin-top: -15px;
 margin-left:75px;
 font-size: 14px;
 display:none;
}
</style>
<body 
  style="background-image: url('https://wallpaperplay.com/walls/full/a/3/0/71487.jpg'); background-size: 100%;">
  <form name="frmlogin" action="Validate.jsp" method="post">
  	<ul class="box">
	  <li><p class="login_style">Login</p></li>
	  <li><p>Username : <input name ="username" id="uname" oninput="checkFieldUsername()" onfocusout="checkFieldUsername()" placeholder=" Enter Username" class="class_input" type="text"/> </p>
	       <p class="fieldrequired" id="requname">Please enter a username!</p>
	  </li>
	  <li><p>Password : <input name ="password" id="pass" oninput="checkFIeldPassword()" onfocusout="checkFIeldPassword()" placeholder=" Enter Password"class="class_input" type="password"/></p>
	       <p class="fieldrequired" id="reqpass">Please enter a password!</p>
	  </li>
	  <li><p><input type="button" value="Login" onClick="checkAndSubmit()"/></p></li>
	  <li><p>Forgot your password ? <a href="#"onclick="forgotPassword()">Click here</a> </p></li>
	</ul>
  </form>
</body>
<script language="Javascript">

 function checkFieldUsername(){
	var valid = true; 
	var vuname = document.getElementById("uname");
	var vrequname = document.getElementById("requname");
	
	 if(document.frmlogin.username.value.length==0){		 
		 vuname.style.borderColor = "red";
		 vuname.style.borderWidth = "2px";
		 vrequname.style.display = "block";
		 valid=false ;
	 }
	 else{
		 vuname.style.borderColor = "black";
		 vuname.style.borderWidth = "1px";
		 vrequname.style.display = "none";
	 }	
	 
	 return valid;	 
 }

 function checkFIeldPassword(){
	 var valid = true; 		
	 var vpass = document.getElementById("pass");
     var vreqpass =document.getElementById("reqpass"); 
     
	 if(document.frmlogin.password.value.length==0){		 
		 vpass.style.borderColor = "red";
		 vpass.style.borderWidth = "2px";
		 vreqpass.style.display = "block";
		 valid=false ;			 			 
	 }
	 else{
		 vpass.style.borderColor = "black";
		 vpass.style.borderWidth = "1px";
		 vreqpass.style.display = "none";
	 }
	 		 
	 return valid;
 }

 function checkAndSubmit(){
	 
	var isUsernameValid =checkFieldUsername();  
	var isPasswordValid =checkFIeldPassword();
	
	if(isUsernameValid && isPasswordValid)
	   frmlogin.submit();
 }
 
 function forgotPassword(){
	 window.open("ForgotPassword.jsp","_self");
 }
 
</script>
</html>