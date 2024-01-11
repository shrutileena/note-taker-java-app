<!DOCTYPE html>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>


	<%
	int noteId = Integer.parseInt(request.getParameter("noteid").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Note note = (Note) s.get(Note.class, noteId);
	%>

	<div class="container-fluid p-20 m-20">
		<br>
		<div class="card text-center"
			style="background: #9c27b0; color: white;">
			<h1>Edit you Note</h1>
		</div>
		<br>


		<form action="UpdateNoteServlet" method="post" m-30 p-30>
		<input value="<%= noteId %>" name="noteid" type="hidden" />
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					type="text" class="form-control" id="title"
					placeholder="Note Title" required="required" name="title" value="<%= note.getTitle() %>">
				<!-- 				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div> -->
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea id="content" placeholder="Note Content"
					class="form-control" style="height: 300px;" required="required"
					name="content"><%= note.getContent() %></textarea>
			</div>
			<!-- <div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div> -->

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>
	</div>
</body>
</html>