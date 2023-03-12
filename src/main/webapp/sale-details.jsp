<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jdc.shop.model.entity.Voucher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sale Details</title>
</head>
<body>
	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>
	<%
	Voucher voucher = (Voucher) request.getAttribute("data");
	%>
	<!-- Title -->
	<h1>Sale Details</h1>

	<!-- Sale Summary -->
	<table>
		<tr>
			<td>Voucher ID</td>
			<td><%=voucher.getId()%></td>
		</tr>
		<tr>
			<td>Voucher Name</td>
			<td><%=voucher.getCustomer()%></td>
		</tr>

		<tr>
			<td>Sale Date</td>
			<td><%=formatDateTime(voucher.getSaleTime())%></td>
		</tr>
	</table>


	<!-- Sale Item Table -->
	<h3>Sale Items</h3>

	<table>
		<thead>
			<tr>
				<td>Product</td>
				<td>Category</td>
				<td>Unit Price</td>
				<td>Qty</td>
				<td>Total</td>
			</tr>
		</thead>
		
		<tbody>
			<%
				for(SaleItem item : voucher.getSales()) {
			%>
			<tr>
				<td><%=item.getProduct().getName() %></td>
				<td><%=item.getProduct().getCategory() %></td>
				<td><%=item.getProduct().getPrice() %></td>
				<td><%=item.getCount() %></td>
				<td><%=item.getTotal() %></td>
			</tr>
			<%
				}
			%>
		</tbody>

	</table>

</body>
</html>