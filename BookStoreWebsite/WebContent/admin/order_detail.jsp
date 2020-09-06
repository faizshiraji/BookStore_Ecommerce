<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Orders - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Details of Order Id: ${order.orderId}</h2>
	</div>
	<c:if test="${message !=null}">
		<div align="center">
			<h4 class="message">${message}</h4>

		</div>
	</c:if>
	
	<jsp:directive.include file="../common/common_order_detail.jsp" />
	
	<div align="center">
		<br /> <a href="edit_order?id=${order.orderId}">Edit this Order</a> &nbsp; &nbsp; &nbsp; &nbsp; <a
			href="">Delete this Order</a>
	</div>
	<jsp:directive.include file="footer.jsp" />

	<script>
		$(document)
				.ready(
						function() {
							$(".deleteLink")
									.each(
											function() {
												$(this)
														.on(
																"click",
																function() {
																	orderId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm('Are you sure you want to delete the Order with id '
																			+ orderId
																			+ ' ?')) {
																		window.location = 'delete_order?id='
																				+ orderId;
																	}
																});
											});
						});
	</script>

</body>
</html>