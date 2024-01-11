<!DOCTYPE html>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-20 m-20">
		<br>

		<div class="card text-center"
			style="background: #9c27b0; color: white;">
			<h1>Notes</h1>
		</div>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>

				<div class="card mt-3">
					<!-- <img src="..." class="card-img-top" alt="..."> -->
					<div class="card-body">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text"><%= note.getContent() %></p>
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?noteid=<%= note.getId() %>" class="btn btn-primary">Update</a>
					</div>
				</div>
				<!-- out.println(note.getTitle() + " : " + note.getContent() + "<br>"); -->

				<%
				}
				s.close();
				%>

			</div>
		</div>


		<br>
	</div>
</body>
</html>