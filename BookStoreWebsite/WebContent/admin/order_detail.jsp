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
	<div align="center">
		<h2>Order Overview:</h2>
		<table>
			<tr>
				<td><b>Ordered By : </b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td><b>Book Copies : </b></td>
				<td>${order.bookCopies}</td>
			</tr>
			<tr>
				<td><b>Total Amount : </b></td>
				<td><fmt:formatNumber value= "${order.total}" type="currency" currencySymbol="Tk "/></td>
			</tr>
			<tr>
				<td><b>Recipient Name : </b></td>
				<td>${order.recipientName}</td>
			</tr>
			<tr>
				<td><b>Recipient Phone : </b></td>
				<td>${order.recipientPhone}</td>
			</tr>
			<tr>
				<td><b>Ship To : </b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td><b>Payment Method : </b></td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td><b>Order Status : </b></td>
				<td>${order.status}</td>
			</tr>
			<tr>
				<td><b>Order Date : </b></td>
				<td>${order.orderDate}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<h2>Ordered Books</h2>
		
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Book Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</tr>
				<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><fmt:formatNumber value= "${orderDetail.book.price}" type="currency" currencySymbol="Tk "/></td>
					<td>${orderDetail.quantity}</td>
					<td><fmt:formatNumber value= "${orderDetail.subtotal}" type="currency" currencySymbol="Tk "/></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="right"><b><i>TOTAL:</i></b></td>
					<td><b>${order.bookCopies}</b></td>
					<td><b><fmt:formatNumber value= "${order.total}" type="currency" currencySymbol="Tk "/></b></td>
				</tr>
		</table>
	</div>
	<div align="center">
	<br />
		<a href="">Edit this Order</a>
		&nbsp; &nbsp; &nbsp; &nbsp;
		<a href="">Delete this Order</a>
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