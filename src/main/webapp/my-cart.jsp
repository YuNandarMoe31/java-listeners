<%@page import="java.text.DecimalFormat"%>
<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.util.List"%>
<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
</head>
<body>
	<h1>My Cart</h1>
	<hr />
	<a href="index.jsp">Back</a>
	<hr />

	<p>Item Details in Shopping Cart</p>

	<%! ShoppingCart cart; %>

	<%!String format(int data) {
		return new DecimalFormat("#,##0").format(data);
	}%>

	<%
	cart = (ShoppingCart) session.getAttribute("cart");
	List<SaleItem> items = cart.items();
	%>

	<table style="width: 60%">
		<tr>
			<td>Product</td>
			<td>Category</td>
			<td>Unit Price</td>
			<td>Count</td>
			<td style="text-align: center;">Total</td>
		</tr>

		<%
		for (SaleItem item : cart.items()) {
		%>
		<tr>
			<td><%=item.getProduct().getName()%></td>
			<td><%=item.getProduct().getCategory()%></td>
			<td><%=item.getProduct().getPrice()%></td>
			<td style="text-align: center;">
				<!-- Minus Count  --> <a
				href="cart-minus?product=<%=item.getProduct().getId()%>">-</a> <%=item.getCount()%>

				<!-- Plus Count  --> <a
				href="cart-plus?product=<%=item.getProduct().getId()%>">+</a>
			</td>
			<td style="text-align: right;"><%=item.getTotal()%></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="3">Total</td>
			<td style="text-align: center;"><%=cart.itemCount()%></td>
			<td style="text-align: right;"><%=format(cart.total())%></td>
		</tr>
	</table>
	<hr />

	<h3>Check Out</h3>

	<form action="checkout" method="post">
		<label>Customer Name</label> <input type="text"
			placeholder="Enter Customer Name" name="customer" /><br />
		<button type="submit">Checkout</button>
	</form>
</body>
</html>