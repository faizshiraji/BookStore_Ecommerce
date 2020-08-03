<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New User</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>Create User</h2>
	</div>
	<div align="center">

		<table>
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" name="email" size="20" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" name="fullname" size="20" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" name="password" size="20" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr colspan="2" align="center">
				<td><input type="submit" value="Submit" /></td>
				<td><input type="button" value="Cancel" /></td>
			</tr>


		</table>

	</div>
	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
	function validateFormInput(){
		
		
	}
</script>
</html>