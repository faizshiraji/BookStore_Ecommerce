<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${book.title}-OnlineBooksStore</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div class="center">
		<table class="book">
			<tr>
				<td colspan="3" align="left">
					<p id="book-title">${book.title}</p> by <span id="author">${book.author}</span>
				</td>
			</tr>
			<tr>
				<td rowspan="2"><img class="book-large"
					src="data:image/jpg;base64,${book.base64Image}" /></td>
				<td valign="top" align="left">Rating: <jsp:directive.include
						file="book_rating.jsp" />
				</td>
				<td valign="top" rowspan="2" width="20%"><h2>$${book.price}</h2>
					<br /> <br />
					<button id="buttonAddToCart" name="buttonAddToCart">Add to Cart</button></td>
			</tr>
			<tr>
				<td id="description">${book.description}</td>
			</tr>
			<tr>
				<td valign="top">&nbsp;</td>
			</tr>
			<tr>
				<td><h2>Customer Reviews</h2></td>
				<td colspan="2" align="center">
					<button id="buttonWriteReview">Write a customer Review</button>
				</td>
			</tr>

			<tr>
				<td colspan="3" align="left">
					<table class="normal">
						<c:forEach items="${book.reviews}" var="review">
							<tr>
								<td><c:forTokens items="${review.stars}" delims=","	var="star">
										<c:if test="${star eq 'on'}">
											<img src="images/rating_on.png" />
										</c:if>
										<c:if test="${star eq 'off'}">
											<img src="images/rating_off.png" />
										</c:if>
									</c:forTokens> <b>${review.headline}</b></td>
							</tr>
							<tr>
								<td> 
								by ${review.customer.fullname} on ${review.reviewTime}
								</td>
							</tr>
							<tr><td><i>${review.comment}</i></td></tr>
						</c:forEach>
					</table>
				</td>
			</tr>

		</table>
	</div>

	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$('#buttonWriteReview').on('click', function() {
				window.location = 'write_review?book_id=' + ${book.bookId}
			});
			$('#buttonAddToCart').on('click', function() {
				window.location = 'add_to_cart?book_id=' + ${book.bookId}
			});
		});
	</script>

</body>

</html>