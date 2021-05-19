<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta charset="ISO-8859-1">
	<title>Configure</title>
	
	<!-- CSS -->
	<style>
		.myForm {
			font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
			font-size: 0.8em;
			width: 30em;
			padding: 1em;
		}
		
		.myForm * {
			box-sizing: border-box;
		}
		
		.myForm label {
			padding: 0;
			font-weight: bold;
			text-align: right;
			display: block;
		}
		
		.myForm input,
		.myForm select,
		.myForm textarea {
			margin-left: 2em;
			float: right;
			width: 20em;
			border: 1px solid #ccc;
			font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
			font-size: 0.9em;
			padding: 0.3em;
		}
		
		.myForm textarea {
			height: 100px;
		}
		
		.myForm button {
			padding: 1em;
			border-radius: 0.5em;
			background: #eee;
			border: none;
			font-weight: bold;
			margin-left: 14em;
			margin-top: 1.8em;
		}
		
		.myForm button:hover {
			background: #ccc;
			cursor: pointer;
		}
	</style>
</head>

<body>
	<form class="myForm" method="post" enctype="application/x-www-form-urlencoded" action="readSettings">
		<p><button>Load</button></p>
	</form>
	<form class="myForm" method="post" enctype="application/x-www-form-urlencoded" action="setSettings">
		<p>
			<label>Host 
				<input type="text" name="host" value=<%=request.getAttribute("host") %> required>
			</label> 
		</p>
		
		<p>
			<label>Core 
				<input type="text" name="core" value=<%=request.getAttribute("core") %> required>
			</label>
		</p>
<!-- 
		<p>
			<label>Enquiry Regarding 
				<select id="pickup_place" name="pickup_place">
				<option value="" selected="selected">Select One</option>
				<option value="website" >Our Website</option>
				<option value="membership" >Membership</option>
				<option value="telepathy" >We'll Guess!</option>
				</select>
			</label> 
		</p>
		
		<p>
			<label>Enquiry 
			<textarea name="comments" maxlength="500"></textarea>
			</label>
		</p>
 -->	
		<p><button>Submit</button></p>
	</form>

</body>
</html>