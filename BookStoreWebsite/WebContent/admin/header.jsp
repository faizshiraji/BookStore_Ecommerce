	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div align="center">

	<div>
		<a href="${pageContext.request.contextPath}/admin/">
			<img alt="" src="../images/BookstoreAdminLogo.png">
		</a>
	</div>
	<div>
		Welcome, <c:out value="${sessionScope.useremail }"></c:out> | <a href="logout">Logout</a> <br> <br />
	</div>
	<div id="headermenu">
		<div >
			<a href="list_users"> <img alt="Users" src="../images/users.png" />
				<br />Users
			</a>
		</div>
		<div>
			<a href="list_category"> <img alt="Categories"
				src="../images/categories.png" /> <br />Categories
			</a>
		</div>
		<div >
			<a href="list_books"> <img alt="Users" src="../images/books.png" />
				<br />Books
			</a>
		</div>
		<div >
			<a href="list_customer"> <img alt="Users"
				src="../images/customers.png" /> <br />Customers
			</a>
		</div>
		<div >
			<a href="list_reviews"> <img alt="Users"
				src="../images/reviews.png" /> <br />Reviews
			</a>
		</div>
		<div >
			<a href="list_orders"> <img alt="Orders"
				src="../images/orders.png" /> <br />Orders
			</a>
		</div>
	</div>
</div> 