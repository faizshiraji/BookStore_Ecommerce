<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:if test="${user !=null}">
			Edit Category
		</c:if> <c:if test="${user ==null}">
			Create New Category
		</c:if></title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>
			<c:if test="${category != null}"> Edit Category </c:if>
			<c:if test="${category == null}">Create New Category</c:if>
		</h2>
	</div>
	<div align="center">
		<c:if test="${category !=null}">
			<form action="update_category" method="post"
				onsubmit="return validateFormInput()">
				<input type="hidden" name="categoryId" value="${category.categoryId}" />
		</c:if>
		<c:if test="${category ==null}">
			<form action="create_category" method="post"
				onsubmit="return validateFormInput()">
		</c:if>
		<table>
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" name="name"
					id="name" size="20" value="${category.name}" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Submit" /> <input type="button" value="Cancel"
					onclick="javascript:history.go(-1);" /></td>
			</tr>


		</table>
		</form>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
	function validateFormInput() {
		var fieldName = document.getElementById("name");
		if (fieldName.value.length == 0) {
			alert("Category Name is required!");
			fieldName.focus();
			return false;
		}
		return true;
	}
</script>
</html>