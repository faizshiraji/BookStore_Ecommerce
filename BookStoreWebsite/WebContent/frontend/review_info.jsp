<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Review - Online Book Store</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<form id="reviewForm" name="reviewForm">
			<table class="normal" width="60%">
				<tr>
					<td><h3>Your already wrote a review for this book</h3></td>
					<td>&nbsp;</td>
					<td><h2>${loggedCustomer.fullname}</h2></td>
				</tr>
				<tr>
					<td colspan="3"><hr /></td>
				</tr>
				<tr>
					<td> <b>Your rating:</b> 
						<c:forTokens items="${review.stars}" delims="," var="star">
							<c:if test="${star eq 'on'}"><img src="images/rating_on.png" /></c:if>
							<c:if test="${star eq 'off'}"><img src="images/rating_off.png" /></c:if>
						</c:forTokens>
					</td>
				</tr>
				<tr>
					<td><span id="book-title">${book.title}</span><br /> <img
						class="book-large" src="data:image/jpg;base64,${book.base64Image}" />
					</td>
					<td>
						<div id="rateYo"></div> <br /> <input type="text" name="headline"
						size="60" readonly="readonly" value="${review.headline}" /> <br />
					<br /> <textarea rows="10" cols="70" name="comment" readonly>${review.comment}
						</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(function() {
		$("#rateYo").rateYo({
		    starWidth:"40px",
		    fullStar: true,
			rating: ${review.rating}
			readOnly: true
		    }
		  });
	});
</script>
</html>