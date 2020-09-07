<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title><c:if test="${user !=null}">
			Edit User
		</c:if> <c:if test="${user ==null}">
			Create New User
		</c:if></title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${user != null}"> Edit User </c:if>
			<c:if test="${user == null}">Create New User</c:if>
		</h2>
	</div>
	<div align="center">
		<c:if test="${user !=null}">
			<form id="userForm" action="update_user" method="post">
				<input type="hidden" name="userId" value="${user.userId}" />
		</c:if>
		<c:if test="${user ==null}">
			<form action="create_user" method="post" name="userForm">
		</c:if>
		<table class="form">
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" name="email" id="email"
					size="20" value="${user.email}" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" name="fullname"
					id="fullname" size="20" value="${user.fullName}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password"
					name="password" size="20" value="${user.password}" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Submit</button>
					<button onclick="javascript:history.go(-1);">Cancel</button>
				</td>
			</tr>


		</table>
		</form>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
	$(function() {
		$("form[name='userForm']")
				.validate(
						{
							rules : {
								fullname : "required",
								email : {
									required : true,
									email : true
								},
								password : {
									required : true,
									minlength : 5
								}
							},
							messages : {
								fullname : " Please enter your full name",
								password : {
									required : " Please provide a password",
									minlength : " Your password must be at least 5 characters long"
								},
								email : " Please enter a valid email address"
							},
							submitHandler : function(form) {
								form.submit();
							}
						});
	});
</script>
</html>