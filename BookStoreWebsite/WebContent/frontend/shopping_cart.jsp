<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Shopping Cart</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>Your Shopping Cart Details</h2>
		<c:if test="${message !=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>

		<c:set var="cart" value="${sessionScope['cart']}" />

		<c:if test="${cart.totalItems == 0}">
			<h2>There's no items in your cart.</h2>
		</c:if>

		<c:if test="${cart.totalItems > 0}">
			<div>
				<form action="update_cart" method="post" id="cartForm"
					name="cartForm">
					<div>
						<table border=1>
							<tr>
								<th>No</th>
								<th colspan="2">Book</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Subtotal</th>
								<th><a href=""><b>Clear Cart</b></a></th>
							</tr>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
								<tr>
									<td align="center">${status.index + 1}</td>
									<td><img class="book-small" alt=""
										src="data:image/jpg;base64, ${item.key.base64Image}" /></td>
									<td><span id="book-title">${item.key.title}</span></td>

									<td><input type="hidden" name="bookId"
										value="${item.key.bookId}" /> <input type="text"
										name="quantity${status.index + 1}" value="${item.value}"
										size="5" /></td>

									<td align="right"><fmt:formatNumber
											value="${item.key.price}" type="currency" /></td>
									<td align="right"><fmt:formatNumber
											value="${item.value * item.key.price}" type="currency" /></td>
									<td><a href="remove_from_cart?book_id=${item.key.bookId}"><b>Remove</b></a></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3"></td>
								<td align="center"><b>${cart.totalQuantity} book(s)</b></td>
								<td align="right">Total:</td>
								<td span="2" align="right"><fmt:formatNumber
										value="${cart.totalAmount}" type="currency" /></td>
							</tr>
						</table>
					</div>
					<div>
						<table class="normal">
						<tr><td>&nbsp;</td></tr>
							<tr>
								<td></td>
								<td><button type="submit">Update</button></td>
								<td><input type="button" id="clearCart" name="clearCart" value="Clear Cart" /></td>
								<td><a href="${pageContext.request.contextPath}/">Continue
										Shopping</a></td>
								<td><a href="">Checkout</a></td>
							</tr>
						</table>
					</div>
				</form>

			</div>
		</c:if>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(function() {
		$("form[name='cartForm']").validate({
			rules : {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
					quantity${status.index + 1}: {
						required: true, 
						number: true,
						min: 1
						},
				</c:forEach>
			},
			messages : {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
				quantity${status.index + 1}: {
					required: "Please enter quantity", 
					number: "Quantity must be a number",
					min: "Quantity must be greater than 0."
					},
				</c:forEach>
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
		$('#clearCart').on('click', function() {
			window.location = 'clear_cart';
		});
	});
</script>
</html>