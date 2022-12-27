<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${user == null}">
		<% request.setAttribute("NOTIFICATION", "Please login.....");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
		//response.sendRedirect(request.getContextPath()+"/views/login_form.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div class="container">
		<h3><p style="color: #40ff4e;">${NOTIFICATION}</p></h3>

		<%-- <div>
			<button class="btn btn-primary" ><a href="${pageContext.request.contextPath}/views/contact_form.jsp" style="color: white;">Add
				Contact</a><i class="fa-solid fa-user-plus"></i></button>
			<button class="btn btn-primary" ><a href="${pageContext.request.contextPath}/views/profile_page.jsp" style="color: white;">Home</a><i class="fa-solid fa-house-user"></i>
		</div> --%>
<br>
		<table class="table table-striped table-bordered">

			<tr class="thead-dark">
				<th> <i class="fa-solid fa-users"></i> Name</th>
				<th> <i class="fa-solid fa-envelope"></i> email</th>
				<th> <i class="fa-regular fa-address-book"></i> phone</th>
				<th>Actions</th>
			</tr>

			<c:forEach items="${list}" var="contact">

				<tr>
					<td>${contact.name}</td>
					<td>${contact.email}</td>
					<td>${contact.phone}</td>
					<td>
						<button type="button" class="btn btn-success">
							<a
								href="${pageContext.request.contextPath}/ContactServlet?action=EDIT&id=${contact.id}"
								style="color: white;">Edit <i class="fa-solid fa-pen-to-square"></i></a>
						</button>
						<button type="button" class="btn btn-danger">
							<a
								href="${pageContext.request.contextPath}/ContactServlet?action=DELETE&id=${contact.id}"
								onclick="return confirm('Are you sure you want to delete this item?');"
								style="color: white;">Delete <i class="fa-sharp fa-solid fa-trash"></i></a>
						</button>
					</td>
				</tr>

			</c:forEach>

		</table>

	</div>
	<%@include file="footer.jsp" %>
</body>
</html>