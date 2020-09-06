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
			<jsp:directive.include file="../common/customer_form.jsp" />
		</form>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript" src="../js/customer-form.js"></script>
</html>