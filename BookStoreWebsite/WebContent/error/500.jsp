<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Internal Server Error</title>

</head>

<body>

		<div align="center">
			<img alt="" src="${pageContext.request.contextPath}/images/BookstoreAdminLogo.png">
		</div>
		<div align="center" >
			<h2>Sorry, the server has encountered an error while fulfulling your request.</h2>
			<h3>Please check back later or contact our administrators.</h3>
		</div>
		<div align="center">
		<a href="javascript:history.go(-1);">Go Back</a>
		</div>
</body>
</html>