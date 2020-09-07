<div align="center">
		<h2>Order Overview:</h2>
		<table>
			<tr>
				<td><b>Ordered By : </b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td><b>Order Status : </b></td>
				<td>${order.status}</td>
			</tr>
			<tr>
				<td><b>Order Date : </b></td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td><b>Payment Method : </b></td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td><b>Book Copies : </b></td>
				<td>${order.bookCopies}</td>
			</tr>
			<tr>
				<td><b>Total Amount : </b></td>
				<td><fmt:formatNumber value="${order.total}" type="currency"
						currencySymbol="Tk " /></td>
			</tr>

			<tr>
				<td><b>Recipient First Name : </b></td>
				<td>${order.firstname}</td>
			</tr>
			<tr>
				<td><b>Recipient Phone : </b></td>
				<td>${order.phone}</td>
			</tr>
			
			<tr>
				<td><b>Shipping Address Line 01 : </b></td>
				<td>${order.addressLine1}</td>
			</tr>
		
			
		</table>
	</div>
	
	<div align="center">
		<h2>Recipient Information:</h2>
		<table>
			<tr>
				<td><b>First Name : </b></td>
				<td>${order.firstname}</td>
			</tr>
			<tr>
				<td><b>Last Name : </b></td>
				<td>${order.lastname}</td>
			</tr>
			<tr>
				<td><b>Phone : </b></td>
				<td>${order.phone}</td>
			</tr>
			<tr>
				<td><b>Address Line 01 : </b></td>
				<td>${order.addressLine1}</td>
			</tr>
			<tr>
				<td><b>Address Line 02 : </b></td>
				<td>${order.addressLine2}</td>
			</tr>
			<tr>
				<td><b>City : </b></td>
				<td>${order.city}</td>
			</tr>
			<tr>
				<td><b>State : </b></td>
				<td>${order.state}</td>
			</tr>
			<tr>
				<td><b>Country : </b></td>
				<td>${order.countryName}</td>
			</tr>
			<tr>
				<td><b>Zip Code : </b></td>
				<td>${order.zipcode}</td>
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
			<c:forEach items="${order.orderDetails}" var="orderDetail"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td><img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64">
					${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><fmt:formatNumber value="${orderDetail.book.price}"
							type="currency" currencySymbol="Tk " /></td>
					<td align="center">${orderDetail.quantity}</td>
					<td align="right"><fmt:formatNumber value="${orderDetail.subtotal}"
							type="currency" currencySymbol="Tk " /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right"><b><i>Sub Total:</i></b></td>
				<td align="center"><b>${order.bookCopies}</b></td>
				<td align="right"><b><fmt:formatNumber value="${order.subtotal}" type="currency" currencySymbol="Tk " /></b></td>
			</tr>
			<tr>
				<td colspan="5" align="right"><b><i>TAX:</i></b></td>
				<td align="right"><b><fmt:formatNumber value="${order.tax}" type="currency" currencySymbol="Tk " /></b></td>
			</tr>
			<tr>
				<td colspan="5" align="right"><b><i>Shipping Fee:</i></b></td>
				<td align="right"><b><fmt:formatNumber value="${order.shippingFee}" type="currency" currencySymbol="Tk " /></b></td>
			</tr>
			<tr>
				<td colspan="5" align="right"><b>TOTAL:</b></td>
				<td align="right"><b><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="Tk " /></b></td>
			</tr>
			
		</table>
	</div>