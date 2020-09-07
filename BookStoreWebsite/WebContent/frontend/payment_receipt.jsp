<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment Receipt - Online Book Store</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>You have made payment successfully. Thank you for your purchasing!</h2>
		<jsp:directive.include file="receipt.jsp" />
		<div>
		<br />
				<input type="hidden" name="paymentId" value="${param.paymentId}" />
				<input type="hidden" name="PayerID" value="${param.PayerID}" />
				<input type="submit" value="Print Receipt" onclick="javascript:showPrintReceiptPopUp();"/>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
	
	<script>
		function showPrintReceiptPopUp(){
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.width - width) / 2;
			
			window.open('frontend/print_receipt.jsp', '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
		}
	</script>
</body>
</html>