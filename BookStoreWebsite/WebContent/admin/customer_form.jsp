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
<title><c:if test="${customer !=null}">
			Edit Customer
		</c:if> <c:if test="${user ==null}">
			Create New Customer
		</c:if></title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${customer != null}"> Edit Customer </c:if>
			<c:if test="${customer == null}">Create New Customer</c:if>
		</h2>
	</div>
	<div align="center">
		<c:if test="${customer !=null}">
			<form action="update_customer" method="post"
				onsubmit="return validateFormInput()">
				<input type="hidden" name="customerId"
					value="${customer.customerId}" />
		</c:if>
		<c:if test="${customer ==null}">
			<form action="create_customer" method="post" name="customerForm">
		</c:if>
		<table class="form">
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" name="email" id="email"
					size="20" value="${customer.email}" /></td>
			</tr>
						<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" name="password" id="password"
					size="20" value="${customer.password}" /></td>
			</tr>
									<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" name="confirmPassword" id="confirmPassword"
					size="20" value="${customer.password}" /></td>
			</tr>
			
						<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" name="fullName" id="fullName"
					size="20" value="${customer.fullName}" /></td>
			</tr>
						<tr>
				<td align="right">Address:</td>
				<td align="left"><input type="text" name="address" id="address"
					size="20" value="${customer.address}" /></td>
			</tr>
						<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" name="city" id="city"
					size="20" value="${customer.city}" /></td>
			</tr>
						<tr>
				<td align="right">Country:</td>
				<td align="left"><input type="text" name="country" id="country"
					size="20" value="${customer.country}" /></td>
			</tr>
						<tr>
				<td align="right">Phone:</td>
				<td align="left"><input type="text" name="phone" id="phone"
					size="20" value="${customer.phone}" /></td>
			</tr>
						<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" name="zipCode" id="zipCode"
					size="20" value="${customer.zipCode}" /></td>
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
	$("form[name='customerForm']")
			.validate(
					{
						rules : {
							email: {
								required: true,
								email: true
							},
							fullName : "required",
							password : "required",
							
							confirmPassword : {
								required: true,
								equalTo: "#password"
							},
							
							phone : "required",
							address : "required",
							city : "required",
							zipCode : "required",
							country : "required"
						},
						messages : {
							email: {
									required: "Please enter e-mail address", 
									email: "Please enter a valid e-mail address"
									}, 
							fullName: "Please enter full name.",
							password : "Please enter your password.",
							confirmPassword : {
								required: "Please enter your confirm password.",
								equalTo: "Confirm password does not match."
							},
							phone : "Please enter phone number.",
							address : "Please enter your address.",
							city : "Please enter your city.",
							zipCode : "Please enter your zip code number.",
							country : "Please enter your country."
						},
						submitHandler : function(form) {
							form.submit();
						}
					});
});
</script>
</html>