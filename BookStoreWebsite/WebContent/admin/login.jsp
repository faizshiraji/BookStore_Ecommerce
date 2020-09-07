<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div align="center">
		<h1>Book Store Administration</h1>
		<h2>Admin Login</h2>
	<c:if test="${message !=null}">
		<div align="center">
			<h4 class="message">${message}</h4>
		</div>
	</c:if>
		<form action="login" method="post" name="loginForm">
			<table class="form">
				<tr>
					<td align="right">Email:</td>
					<td align="left"><input type="text" name="email"
						id="email" size="20"/></td>
				</tr>
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="password" id="password"
						name="password" size="20"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("form[name='loginForm']").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
				}
			},
			messages : {
				password : {
					required : " Please provide your password",
				},
				email : " Please enter your registered email address."
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>