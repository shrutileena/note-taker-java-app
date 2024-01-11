<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-20 m-20">
		<br>

		<div class="card text-center" style="background: #9c27b0; color: white;"><h1>Please fill your note details</h1></div>
		<!-- form -->
		<br>
		<form action="SaveNoteServlet" method="post" m-30 p-30>
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					type="text" class="form-control" id="title"
					placeholder="Note Title" required="required" name="title">
				<!-- 				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div> -->
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea id="content" placeholder="Note Content"
					class="form-control" style="height: 300px;" required="required" name="content"></textarea>
			</div>
			<!-- <div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div> -->

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>