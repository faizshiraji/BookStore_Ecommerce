<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title>Edit Review</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Edit Review</h2>
	</div>
	<div align="center">
			<form id="reviewForm" name="reviewForm" action="update_review" method="post" onsubmit="return validateFormInput()">
				<input type="hidden" name="reviewId" value="${review.reviewId}" />
		<table class="form">
			<tr>
				<td align="right">Book:</td>
				<td align="left">${review.book.title}</td>
			</tr>
			<tr>
				<td align="right">Rating:</td>
				<td align="left">${review.rating}</td>
			</tr>
			<tr>
				<td align="right">Customer:</td>
				<td align="left">${review.customer.fullname}</td>
			</tr>
			<tr>
				<td align="right">Headline:</td>
				<td align="left"><input type="text" name="headline" id="headline" size="20" value="${review.headline}" /></td>
			</tr>
			<tr>
				<td align="right">Comment:</td>
				<td align="left"><input type="text" name="comment" id="comment" size="20" value="${review.comment}" /></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Submit</button>
					<button onclick="javascript:history.go(-1);">Cancel</button>
				</td>
			</tr>
			
		</table>
		</form>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
	$(function() {
		$("form[name='reviewForm']")
				.validate(
						{
							rules : {
								headline : "required",
								comment : "required"
							},
							messages : {
								headline : " Please enter comment headline.",
								comment : " Please enter comment."
							},
							submitHandler : function(form) {
								form.submit();
							}
						});
	});
</script>
</html>