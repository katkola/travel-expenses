<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
<meta charset="UTF-8">
<title>Show Expense</title>
</head>
<body>
	<div id="main">
		<div class="navbar">
			<h1 class="nav-title">Expense Details</h1>
			<a class="nav-links" href="/expenses">Go Back</a>
		</div>
		<div>
			<table class="table">
			<tr>
				<td>Expense Name: </td>
				<td><c:out value="${expense.name}"/></td>
			</tr>
			<tr>
				<td>Expense Description: </td>
				<td><c:out value="${expense.description}"/></td>
			</tr>
			<tr>
				<td>Vendor: </td>
				<td><c:out value="${expense.vendor}"/></td>
			</tr>
			<tr>
				<td>Amount Spent: </td>
				<td><c:out value="${expense.amount}"/></td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>