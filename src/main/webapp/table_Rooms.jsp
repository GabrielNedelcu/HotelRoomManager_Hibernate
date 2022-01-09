<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	
	<!-- Required meta tags -->
   	<meta charset="utf-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1">
    	
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<title>View Rooms</title>
</head>
<body>
	<div class = "container">
		<h1 align="center"> All Rooms </h1>
		<!-- Data Table -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Room Number</th>
					<th scope="col">Floor</th>
					<th scope="col">Price per Night</th>
					<th scope="col">Room Type</th>
					<th scope="col">Smoking Allowed</th>
					<th scope="col">Next available date</th>
					<th scope="col">Edit Room</th>
					<th scope="col">Delete Room</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="room" items="${roomPool}">
					<tr>
						<!-- Client DATA -->
						<td> ${room.roomId} </td>
						<td> ${room.roomNumber} </td>
						<td> ${room.roomFloor} </td>
						<td> ${room.roomPrice} </td>
						<td> ${room.roomType} </td>
						<td> ${room.roomSmoking} </td>
						<td> ${room.roomNextAvaliableDate} </td>
						
						<!-- Edit/Delete Buttons -->
						<td>
							<form action="RoomController" method="POST">
								<button type="submit" class="btn btn-primary" name="editRoom" value="${room.roomId}">
		      						Edit
		    					</button>
							</form>
						</td>
						<td>
							<form action="RoomController" method="POST">
								<button type="submit" class="btn btn-danger" name="deleteRoom" value="${room.roomId}">
		      						Delete
		    					</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
	
	<!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>