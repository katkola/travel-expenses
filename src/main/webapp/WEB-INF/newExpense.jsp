<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
<meta charset="UTF-8">
<title>Read Share</title>
</head>
<body>
	<div class="main">
		<h1>Safe Travels</h1>
		<div class="existing table">
			<table class="table">
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="expense" items="${allExpenses}">
				<tr>
					<td><a href="/expenses/${expense.id}"><c:out value="${expense.name}"/></a></td>
					<td><c:out value="${expense.vendor}"/></td>
					<td><c:out value="${expense.amount}"/></td>
					<td><a href="/expenses/edit/${expense.id}">Edit</a></td>
					<td>
						<form action="/expenses/${expense.id}" method="post">
							<input type="hidden" name="_method" value="delete" />
							<input type="submit" value="delete" />
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="addexp">
			<form:form action="/expenses/create" method="POST" modelAttribute="expense" class="form-body">
				<div class="form-group">
					<form:label path="name">Expense Name: </form:label>
					<form:input class="form-control" path="name"/>
					<form:errors path="name"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="vendor">Vendor: </form:label>
					<form:input class="form-control" path="vendor"/>
					<form:errors path="vendor"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="amount">Amount: </form:label>
					<form:input class="form-control" type="number" path="amount"/>
					<form:errors path="amount"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="description">Description: </form:label>
					<form:input class="form-control" path="description"/>
					<form:errors path="description"></form:errors>
				</div>
				<input type="submit" value="Submit" />
			</form:form>
		</div>
	
	</div>
</body>
</html>