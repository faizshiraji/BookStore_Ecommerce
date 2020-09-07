<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" />
</head>
<body>

	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Administrative Dashboard</h2>
	</div>
	<div align="center">
		<hr width="60%" />
		<h2 class="pageheading">Quick Access:</h2>
		<b> <a href="new_book">New Book</a> &nbsp; <a href="user_form.jsp">New
				User</a> &nbsp; <a href="category_form.jsp">New Category</a> &nbsp; <a
			href="new_customer">New Customer</a> &nbsp;
		</b>
	</div>

	<div align="center">
		<hr width="60%" />
		<h2 class="pageheading">Recent Sales:</h2>
		<table border="1">
			<tr>
				<th>Order ID</th>
				<th>Ordered By</th>
				<th>Book Copies</th>
				<th>Total</th>
				<th>Payment Method</th>
				<th>Status</th>
				<th>Order Date</th>
			</tr>
			<c:forEach items="${listMostRecentSales}" var="order"
				varStatus="status">
				<tr>
					<td><a href="view_order?id=${order.orderId}">${order.orderId}</a></td>
					<td>${order.customer.fullname}</td>
					<td>${order.bookCopies}</td>
					<td><fmt:formatNumber value="${order.total}" type="currency"
							currencySymbol="Tk " /></td>
					<td>${order.paymentMethod}</td>
					<td>${order.status}</td>
					<td>${order.orderDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div align="center">
		<hr width="60%" />
		<h2 class="pageheading">Recent Reviews:</h2>
		<table border="1">
			<tr>
				<th>Book</th>
				<th>Rating</th>
				<th>Headline</th>
				<th>Customer</th>
				<th>Review On</th>
			</tr>
			<c:forEach items="${listMostRecentReviews}" var="review"
				varStatus="status">
				<tr>
					<td>${review.book.title}</td>
					<td>${review.rating}</td>
					<td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
					<td>${review.customer.firstname}</td>
					<td>${review.reviewTime}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div align="center">
		<hr width="60%" />
		<h2>Statistics:</h2>
		Total Users: ${totalUsers} &nbsp; &nbsp; &nbsp; &nbsp;
		Total Users: ${totalBooks} &nbsp; &nbsp; &nbsp; &nbsp; 
		Total Users: ${totalCustomers} &nbsp; &nbsp; &nbsp; &nbsp; 
		Total Users: ${totalReviews} &nbsp; &nbsp; &nbsp; &nbsp; 
		Total Users: ${totalOrders} 
		<hr width="60%" />
	</div>


	<jsp:directive.include file="footer.jsp" />

</body>
</html>