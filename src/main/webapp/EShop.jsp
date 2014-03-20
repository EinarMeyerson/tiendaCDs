
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>
<html>
<head>
<title>Music Without Borders</title>
</head>
<body bgcolor="#33CCFF">
	<font face="Times New Roman,Times" size="+3"> Music Without
		Borders </font>
	<hr>
	<p>
	<center>

		<sql:setDataSource var="testDB" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/tiendacd" user="root" password="wasera" />

		<sql:query dataSource="${testDB}" var="result">
SELECT * from CD;
</sql:query>
		<form name="shoppingForm" action="/tiendaCDs/ShoppingServlet"
			method="POST">
			<b>CD:</b> <select name=CD>
				<c:forEach var="row" items="${result.rows}">
					<option>
						<c:out value="${row.NombreCD}" /> |
						<c:out value="${row.NombreGrupo}" /> |
						<c:out value="${row.Pais}" /> |
						<c:out value="${row.Price}" />
					</option>
				</c:forEach>
			</select> <b>Quantity: </b><input type="text" name="qty" SIZE="3" value=1>
			<input type="hidden" name="action" value="ADD"> <input
				type="submit" name="Submit" value="Add to Cart">
		</form>
	</center>
	<p>
		<jsp:include page="Cart.jsp" flush="true" />
</body>
</html>
