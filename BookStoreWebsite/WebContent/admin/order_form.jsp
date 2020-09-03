<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Order - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Edit Order Id: ${order.orderId}</h2>
	</div>
	<c:if test="${message !=null}">
		<div align="center">
			<h4 class="message">${message}</h4>

		</div>
	</c:if>
	
	<form action="update_order" method="post" id="orderForm" name="orderForm">
	<div align="center">
		<table>
			<tr>
				<td><b>Ordered By : </b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td><b>Order Date : </b></td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td><b>Recipient Name : </b></td>
				<td>
					<input type="text" name="recipientName" size="45" value="${order.recipientName}">
				</td>
			</tr>
			<tr>
				<td><b>Recipient Phone : </b></td>
				<td>
					<input type="text" name="recipientPhone" size="45" value="${order.recipientPhone}">
				</td>
			</tr>
			<tr>
				<td><b>Ship To : </b></td>
				<td>
					<input type="text" name="shippingAddress" size="45" value="${order.shippingAddress}">
				</td>
			</tr>
			<tr>
				<td><b>Payment Method : </b></td>
				<td>
					<select name="paymentMethod">
						<option value="Cash On Delivery">Cash On Delivery</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>Order Status : </b></td>
				<td>
					<select name="orderStatus" value="${order.status}">
						<option value="Processing" <c:if test="${order.status eq 'Processing' }">selected='selected'</c:if> >Processing</option>
						<option value="Shipping" <c:if test="${order.status eq 'Shipping' }">selected='selected'</c:if> >Shipping</option>
						<option value="Delivered" <c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if> >Delivered</option>
						<option value="Completed" <c:if test="${order.status eq 'Completed' }">selected='selected'</c:if> >Completed</option>
						<option value="Cancelled" <c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if> >Cancelled</option>
					</select>
				</td>
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
				<th></th>
			</tr>
			<c:forEach items="${order.orderDetails}" var="orderDetail"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td>
						<fmt:formatNumber value="${orderDetail.book.price}" type="currency" currencySymbol="Tk " />
					</td>
					<td>
						<input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
						<input type="text" name="quantity${status.index + 1}" size="5" value="${orderDetail.quantity}">
					</td>
					<td>
						<input type="hidden" name="price" value="${orderDetail.book.price}" />
						<fmt:formatNumber value="${orderDetail.book.price}" type="currency" currencySymbol="Tk " />
					</td>
					<td>
						<a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right"><b><i>TOTAL:</i></b></td>
				<td>${order.bookCopies}</td>
				<td>
					<b><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="Tk " /></b>
				</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<br />
			<a href="javascript:showAddBookPopup()">Add Books</a> &nbsp; &nbsp; &nbsp; &nbsp; 
			<input type="submit" value="Save" />&nbsp; &nbsp; &nbsp; &nbsp; 
			<input type="button" value="Cancel" onclick="javascript:window.location.href='list_order';" />
	</div>
	
	</form>
	<jsp:directive.include file="footer.jsp" />

	<script>
	$("form[name='orderForm']")
	.validate(
			{
				rules : {
					recipientName : "required",
					recipientPhone : "required",
					shippingAddress : "required",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}:
						{
							required: true, 
							number: true,
							min: 1
						},
					</c:forEach>
				},
				messages : {
					recipientName : " Please enter your Recipient Name",
					recipientPhone : " Please enter your Recipient Phone Number",
					shippingAddress : " Please enter your Shipping Address",
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					
					quantity${status.index + 1}:
					{
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
	
		function showAddBookPopup(){
			var width = 600;
			var height = 240;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			
			window.open('add_book_form', '_blank', 'width='+width+', height='+height+', top='+top+', left='+left);
		};
		
	</script>

</body>
</html>