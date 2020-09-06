<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2 class="pageheading">Register as a Customer</h2>
	</div>
	<div align="center">
		<form action="register_customer" method="post" name="customerForm">
			<jsp:directive.include file="../common/customer_form.jsp" />
		</form>
	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript" src="js/customer-form.js"></script>
</html>