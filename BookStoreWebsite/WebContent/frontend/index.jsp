<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Store Website</title>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br /> <br />
		<h3>This is main content:</h3>
		<h2>New Books:</h2>
		<div align="center" style="width: 80%; margin: 0 auto;">
			<c:forEach items="${listNewBooks}" var="book">
				<div
					style="display: inline-block; margin: 20px; width: 300px; word-wrap: break-word;">
					<div>
						<a href="view_book?id=${book.bookId}"> <img alt=""
							src="data:image/jpg;base64, ${book.base64Image}" width="128"
							height="164" />
						</a>
					</div>
					<div>
						<a href="view_book?id=${book.bookId}"> <b>${book.title}</b>
						</a>
					</div>
					<div>Rating *****</div>
					<div>by ${book.author}</div>
					<div>
						<b>$${book.price}</b>
					</div>
				</div>


			</c:forEach>
		</div>
		<div align="center" style="clear:both">
			<h2>Best-Selling Books:</h2>
		</div>

		<div align="center" style="clear:both">
			<h2>Most-favored Books:</h2>
		</div>

		<br /> <br />
	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
</html>