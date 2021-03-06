<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true"%>
<jsp:useBean id="connecteduser" class="it.lidobalneare.bean.User" scope="session" />

<%
boolean unreg = false;
try{
	unreg = session.getAttribute("unregistered").equals("YES");
} catch (NullPointerException e){}
try{
	
	if(!connecteduser.isAdmin()){
		response.sendRedirect("./errorpage.html");
		return;
	}
} catch (NullPointerException e){
	response.sendRedirect("login.html");
	return;
}
%>

<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
	
	<title>LidoBalneare</title>
	
	<script src="assets/js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Anonymous+Pro" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" />
	<link rel="stylesheet" href="assets/fonts/font-awesome.min.css" />
	<link rel="stylesheet" href="assets/css/menu-collapse-ultimate.css" />
	<link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>
	<%@include file="alertbox.html"%>

	<!-- Pass edit form box -->
	<form id="pass_edit_form" class="alertscreen">
		<div class="alertwindow">
			<span class="lidoalerttitle">Edit pass</span>
			<hr class="lidohr" />

			<input id="pass_email" type="text" class="lidoblockstyle" placeholder='Email address' disabled/>
			<input id="pass_begin" type="date" class="lidoblockstyle border rounded border-primary" placeholder='Start date' />
			<input id="pass_end" type="date" class="lidoblockstyle border rounded border-primary" placeholder='End date' />
			<input id="pass_seat" type="text" class="lidoblockstyle" placeholder='Seat name' />

			<div class="btn-group lidobtngroup" role="group">
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick="updateReservation()">Update</button>
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick="deleteReservation()">Delete</button>
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick='$("#pass_edit_form").fadeOut(500);'>Cancel</button>
			</div>
		</div>
	</form>

	<!-- Booking edit form box -->
	<form id="booking_edit_form" class="alertscreen">
		<div class="alertwindow">
			<span class="lidoalerttitle">Edit booking</span>
			<hr class="lidohr" />

			<input id="book_email" type="text" class="lidoblockstyle" placeholder='Email address' disabled/>
			<input id="book_day" type="date" class="lidoblockstyle border rounded border-primary" placeholder='Date' />
			<select	class="lidoblockstyle border rounded border-primary" id="book_slot" name="timeZone">
				<option value="0">All Day</option>
				<option value="1">9:00-12:00</option>
				<option value="2">12:00-15:00</option>
				<option value="3">15:00-18:00</option>
			</select>
			<input id="book_seat" type="text" class="lidoblockstyle" placeholder='Seat name' />

			<div class="btn-group lidobtngroup" role="group">
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick="updateReservation()">Update</button>
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick="deleteReservation()">Delete</button>
				<button class="btn btn-primary lidobtnofbtngroup" type="button"	onclick='$("#booking_edit_form").fadeOut(500);'>Cancel</button>
			</div>
		</div>
	</form>

	<div class="divcontainer">
		<%@include file="navAdmin.html"%>
		<script>
        	document.getElementById("nav_admin").classList.add("active");
        </script>

		<div class="contentscreen">
			<span class="toptitle">Reservations</span>
			<% 
			if(!unreg){
				%>
				<span class="logindescription" style="background-color: rgb(220, 220, 220);">Customer: <%= session.getAttribute("customer") %></span>
				<%
			} else {
				%>
				<span class="logindescription" style="background-color: rgb(220, 220, 220);">Unregistered customers</span>
				<%
			}
			%>
			<div class="contentdivscreen">
				<%@include file="booking.jsp" %>
			</div>

			<hr>

			<div class="buttoncontainer">
				<button class="btn btn-primary" type="button" onclick="back()">Back</button>
			</div>
		</div>
	</div>

	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/alert.js"></script>
	<script src="assets/js/bookings.js"></script>
</body>

</html>