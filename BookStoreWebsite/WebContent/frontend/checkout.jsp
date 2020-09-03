<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout - Online Book Store</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
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
				<h2>
					Review Your Order Details <a href="view_cart">Edit</a>
				</h2>
				<div>
					<table border=1>
						<tr>
							<th>No</th>
							<th colspan="2">Book</th>
							<th>Author</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Subtotal</th>
							<th></th>
						</tr>
						<c:forEach items="${cart.items}" var="item" varStatus="status">
							<tr>
								<td align="center">${status.index + 1}</td>
								<td><img class="book-small" alt=""
									src="data:image/jpg;base64, ${item.key.base64Image}" /></td>
								<td><span id="book-title">${item.key.title}</span></td>
								<td><span id="book-author">${item.key.author}</span></td>
								<td align="right"><fmt:formatNumber
										value="${item.key.price}" type="currency" /></td>
								<td><input type="text" name="quantity${status.index + 1}"
									value="${item.value}" size="5" readonly="readonly" /></td>
								<td align="right"><fmt:formatNumber
										value="${item.value * item.key.price}" type="currency" /></td>
								<td><a href="remove_from_cart?book_id=${item.key.bookId}"><b>Remove</b></a></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4"></td>
							<td align="right">Total:</td>
							<td align="center"><b>${cart.totalQuantity} book(s)</b></td>
							<td span="2" align="right"><fmt:formatNumber
									value="${cart.totalAmount}" type="currency" /></td>
						</tr>
					</table>
					<h2>Your Shipping Information:</h2>
					<form id="orderForm" name="orderForm" action="place_order" method="post">
						<table class="normal">
							<tr>
								<td>Recipient Name:</td>
								<td><input type="text" name="recipientName" size="20"
									value="${loggedCustomer.fullname}" /></td>
							</tr>
							<tr>
								<td>Recipient Phone:</td>
								<td><input type="text" name="recipientPhone" size="20"
									value="${loggedCustomer.phone}" /></td>
							</tr>
							<tr>
								<td>Street Address:</td>
								<td><input type="text" name="address" size="20"
									value="${loggedCustomer.address}" /></td>
							</tr>
							<tr>
								<td>City:</td>
								<td><input type="text" name="city" size="20"
									value="${loggedCustomer.city}" /></td>
							</tr>
							<tr>
								<td>Zip Code:</td>
								<td><input type="text" name="zipCode" size="20"
									value="${loggedCustomer.zipcode}" /></td>
							</tr>
							<tr>
								<td>Country:</td>
								<td><input type="text" name="country" size="20"
									value="${loggedCustomer.country}" /></td>
							</tr>

						</table>
						<div align="center">
							<h2>Payment</h2>
							Choose your payment method:
							&nbsp; &nbsp; &nbsp;
							<select name="paymentMethod">
								<option value="Cash On Delivery">Cash On Delivery</option>
							</select>
						</div>
						<div>
						<table class="normal">
						<tr><td>&nbsp;</td></tr>
							<tr>
								<td><button type="submit">Place Order</button></td>
								<td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
							</tr>
						</table>
					</div>
					</form>
				</div>
			</div>
		</c:if>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(function() {
		$("form[name='orderForm']").validate({
			rules : {
				recipientName: "required",
				recipientPhone: "required",
				address: "required",
				city: "required",
				zipCode: "required",
				country: "required"
			},
			messages : {
				recipientName: "Please enter recipient name",
				recipientPhone: "Please enter phone number",
				address: "Please enter street address",
				city: "Please enter city",
				zipCode: "Please enter zipcode",
				country: "Please enter country"
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>