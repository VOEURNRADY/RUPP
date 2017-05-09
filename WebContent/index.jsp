<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style type="text/css">
	.wrapper{
		width: 60%;
	}
	img{
		width: 100px;
		height: 100px;
		float: left;
		padding-left: 40px;
	}
</style>
</head>
<body>
	<center>
	<div class="wrapper">
		<img alt="Logo RUPP" src="imgs/rupp_logo.png">
		<h1>Royal University of Phnom Penh</h1>
		<h2>Computer Science Department</h2><hr/>
			
		<form action="./loginServlet" method="post">
			<fieldset style="width: 300px">
				<legend> Login to App </legend>
				<table>
					<tr>
						<td>User ID</td>
						<td><input type="text" name="username" required="required" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="userpass" required="required" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Login" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	</center>
</body>
</html>