<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/jquery-ui.min.css" />
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>

<title><c:if test="${book !=null}">
			Edit Book
		</c:if> <c:if test="${book ==null}">
			Create New Book
		</c:if></title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${book != null}"> Edit Book </c:if>
			<c:if test="${book == null}">Create New Book</c:if>
		</h2>
	</div>
	<div align="center">
		<c:if test="${book !=null}">
			<form id="bookForm" action="update_book" method="post">
				<input type="hidden" name="bookId" value="${book.bookId}" />
		</c:if>
		<c:if test="${book ==null}">
			<form action="create_book" method="post" name="bookForm">
		</c:if>
		<table class="form">
			<tr>
				<td align="right">Category:</td>
				<td align="left"><select name="category">
						<c:forEach items="${listCategory}" var="category">
							<option value="${category.categoryId}">${category.name}
							</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td align="right">Title:</td>
				<td align="left"><input type="text" name="title" id="title"
					size="20" value="${book.title}" /></td>
			</tr>
			<tr>
				<td align="right">Author:</td>
				<td align="left"><input type="text" name="author" id="author"
					size="20" value="${book.author}" /></td>
			</tr>
			<tr>
				<td align="right">ISBN:</td>
				<td align="left"><input type="text" name="isbn" id="isbn"
					size="20" value="${book.isbn}" /></td>
			</tr>
			<tr>
				<td align="right">Publish Date:</td>
				<td align="left"><input type="text" name="publishDate"
					id="publishDate" size="20" value="${book.publishDate}" /></td>
			</tr>
			<tr>
				<td align="right">Book Image:</td>
				<td align="left"><input type="file" id="bookImage" size="20" /><br />
				<img id="thumbnail" alt="Image Preview" style="width: 20%; margin-top: 10px" />
				</td>
			</tr>
			<tr>
				<td align="right">Price:</td>
				<td align="left"><input type="text" name="price" id="price"
					size="20" value="${book.price}" /></td>
			</tr>
			<tr>
				<td align="right">Description:</td>
				<td align="left"><textarea row="5" cols="50" name="description"
						id="description"></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Submit</button>
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>


		</table>
		</form>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>

<script type="text/javascript">
	$(function() {
		$("#publishDate").datepicker();
		$("#bookImage").change(function(){
			showImageThumbnail(this);
		});	
		
		$("form[name='bookForm']")
				.validate(
						{
							rules : {
								fullname : "required",
								email : {
									required : true,
									email : true
								},
								password : {
									required : true,
									minlength : 5
								}
							},
						messages : {
								fullname : " Please enter your full name",
								password : {
									required : " Please provide a password",
									minlength : " Your password must be at least 5 characters long"
								},
								email : " Please enter a valid email address"
							},
							submitHandler : function(form) {
								form.submit();
							}
						});
		$("buttonCancel").click(function(){
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];

		var reader = new FileReader();

		reader.onload = function(e) {
			$("#thumbnail").attr("src", e.target.result);
		};

		reader.readAsDataURL(file);
	};
</script>
</html>