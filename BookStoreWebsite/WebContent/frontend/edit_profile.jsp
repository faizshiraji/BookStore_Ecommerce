<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<title>Register as a Customer</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Edit My Profile</h2>
	</div>
	<div align="center">
		<form action="update_profile" method="post" name="customerForm">
			<table class="form">
				<tr>
					<td align="right">Email:</td>
					<td align="left"><b>${loggedCustomer.email}</b>(Cannot be changed.)</td>
				</tr>
				<tr>
					<td align="right">First Name:</td>
					<td align="left"><input type="text" name="firstName"
						id="firstName" size="20" value="${loggedCustomer.firstname}" /></td>
				</tr>
				<tr>
					<td align="right">Last Name:</td>
					<td align="left"><input type="text" name="lastName"
						id="lastName" size="20" value="${loggedCustomer.lastname}" /></td>
				</tr>
				<tr>
					<td align="right">Address Line 01:</td>
					<td align="left"><input type="text" name="addressLine1"
						id="addressLine1" size="20" value="${loggedCustomer.addressLine1}" /></td>
				</tr>
				<tr>
					<td align="right">Address Line 02:</td>
					<td align="left"><input type="text" name="addressLine2"
						id="addressLine2" size="20" value="${loggedCustomer.addressLine2}" /></td>
				</tr>
				<tr>
					<td align="right">City:</td>
					<td align="left"><input type="text" name="city" id="city"
						size="20" value="${loggedCustomer.city}" /></td>
				</tr>
				<tr>
					<td align="right">State:</td>
					<td align="left"><input type="text" name="state" id="state"
						size="20" value="${loggedCustomer.state}" /></td>
				</tr>
				<tr>
					<td align="right">Country:</td>
					<td align="left"><select name="country" id="country"
						name="country">
							<c:forEach items="${mapCounties}" var="country">
								<option value="${country.value}"
									<c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
							</c:forEach>
					</select>
				</tr>
				<tr>
					<td align="right">Phone:</td>
					<td align="left"><input type="text" name="phone" id="phone"
						size="20" value="${loggedCustomer.phone}" /></td>
				</tr>
				<tr>
					<td align="right">Zip Code:</td>
					<td align="left"><input type="text" name="zipCode"
						id="zipCode" size="20" value="${loggedCustomer.zipcode}" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<i>(Leave password fields blank if you don't want to change password)</i>
					</td>
				</tr>
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="password" name="password"
						id="password" size="20" /></td>
				</tr>
				<tr>
					<td align="right">Confirm Password:</td>
					<td align="left"><input type="password" name="confirmPassword"
						id="confirmPassword" size="20" /></td>
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
<script type="text/javascript" src="js/customer-form.js"></script>
</html>