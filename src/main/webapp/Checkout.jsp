<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" import="java.util.*, shopping.CD"%>
<html>
<head>
<title>Music Without Borders Checkout</title>
</head>
<body bgcolor="#33CCFF">
	<font face="Times New Roman,Times" size=+3> Music Without
		Borders Checkout </font>
	<hr>
	<p>
	<center>
		<sql:setDataSource var="testDB" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/tiendacd" user="root" password="wasera" />

		<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
			<tr>
				<td><b>ALBUM</b></td>
				<td><b>ARTIST</b></td>
				<td><b>COUNTRY</b></td>
				<td><b>PRICE</b></td>
				<td><b>QUANTITY</b></td>
				<td></td>
			</tr>
			<%
				Vector buylist = (Vector) session.getValue("shopping.shoppingcart");
				String amount = (String) request.getAttribute("amount");
			%>
			<c:set var="code" value="NULL" />
			<c:set var="TotalPrice" value="<%=amount%>" />

			<sql:update dataSource="${testDB}" var="count">
  INSERT INTO COMPRAS(Code, TotalPrice) VALUES(code,${TotalPrice});
		
			</sql:update>
			<%
				for (int i = 0; i < buylist.size(); i++) {
					CD anOrder = (CD) buylist.elementAt(i);
			%>
			<tr>
				<td><b><%=anOrder.getAlbum()%></b></td>
				<td><b><%=anOrder.getArtist()%></b></td>
				<td><b><%=anOrder.getCountry()%></b></td>
				<td><b><%=anOrder.getPrice()%></b></td>
				<td><b><%=anOrder.getQuantity()%></b></td>
			</tr>
			<c:set var="code" value="NULL" />
			<c:set var="price" value="<%=anOrder.getPrice()%>" />
			<c:set var="Album" value="<%=anOrder.getAlbum()%>" />
			<c:set var="Grupo" value="<%=anOrder.getArtist()%>" />
			<c:set var="Pais" value="<%=anOrder.getCountry()%>" />
			<c:set var="cantida" value="<%=anOrder.getQuantity()%>" />

			<sql:update dataSource="${testDB}" var="count">
  INSERT INTO INFOCOMPRAS(Code, Price, NombreCD, NombreGrupo, Pais, Cantidad, Compra) VALUES(code,${price},'${Album}','${Grupo}','${Pais}',${cantida},(SELECT MAX(Code) FROM COMPRAS));

			</sql:update>


			<%
				}
				session.invalidate();
			%>
			<tr>
				<td></td>
				<td></td>
				<td><b>TOTAL</b></td>
				<td><b>$<%=amount%></b></td>
				<td></td>
			</tr>
		</table>
		<p>
			<a href="/tiendaCDs/EShop.jsp">Shop some more!</a>
	</center>
</body>
</html>


