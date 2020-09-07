<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" />
<title>Customer Profile - Online Books Store</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br />
		<h3>
			Welcome <b>${loggedCustomer.fullname}</b>
		</h3>
		<br />
		<table class="normal">
			<tr>
				<td><b>E-mail Address:</b></td>
				<td>${loggedCustomer.email}</td>
			</tr>
			<tr>
				<td><b>First Name:</b></td>
				<td>${loggedCustomer.firstname}</td>
			</tr>
			<tr>
				<td><b>Last Name:</b></td>
				<td>${loggedCustomer.lastname}</td>
			</tr>
			<tr>
				<td><b>Phone Number:</b></td>
				<td>${loggedCustomer.phone}</td>
			</tr>
			<tr>
				<td><b>Address Line 01:</b></td>
				<td>${loggedCustomer.addressLine1}</td>
			</tr>
			<tr>
				<td><b>Address Line 02:</b></td>
				<td>${loggedCustomer.addressLine2}</td>
			</tr>
			<tr>
				<td><b>City:</b></td>
				<td>${loggedCustomer.city}</td>
			</tr>
			<tr>
				<td><b>State:</b></td>
				<td>${loggedCustomer.state}</td>
			</tr>
			<tr>
				<td><b>Zip Code:</b></td>
				<td>${loggedCustomer.zipcode}</td>
			</tr>
			<tr>
				<td><b>Country:</b></td>
				<td>${loggedCustomer.countryName}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<b><a href="edit_profile">Edit My Profile</a></b></td>
			</tr>
		</table>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>