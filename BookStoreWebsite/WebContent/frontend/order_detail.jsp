<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Order Details - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<c:if test="${order==null}">
		<div align="center">
			<h2 class="pageheading">Sorry, you are not authorized to view
				this order.</h2>
		</div>
	</c:if>

	<c:if test="${order !=null}">
		<div align="center">
		<h2>Your Order ID: ${order.orderId}</h2>
		</div>

		<jsp:directive.include file="../common/common_order_detail.jsp" />
	</c:if>
	<jsp:directive.include file="footer.jsp" />

</body>
</html>