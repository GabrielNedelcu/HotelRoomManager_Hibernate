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

	<!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Hotel Manager</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
            	<form action="">
            		<a class="nav-link active" aria-current="page" href="/home">Home</a>
            	</form>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Rooms
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li>
                	<form action="RoomController" method="POST">
                		<button type="submit" class="dropdown-item" name="showAllRooms" value="Show">
                			View Rooms
                		</button>
                	</form>
                </li>
                <li>
                	<form action="RoomController" method="GET">
                		<button type="submit" class="dropdown-item" name="addRoom" value="Add">
                			Add a Room
                		</button>
                	</form>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Clients
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li>
                	<form action="ClientController" method="POST">
                		<button type="submit" class="dropdown-item" name="showAllClients" value="Show">
                			View Clients
                		</button>
                	</form>
                </li>
                <li>
                	<form action="ClientController" method="GET">
                		<button type="submit" class="dropdown-item" name="addClient" value="Add">
                			Add a Client
                		</button>
                	</form>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Reservations
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li>
                	<form action="ReservationController" method="POST">
                		<button type="submit" class="dropdown-item" name="showAllReservations" value="Show">
                			View Reservations History
                		</button>
                	</form>
                </li>
                <li>
                	<form action="ReservationController" method="GET">
                		<button type="submit" class="dropdown-item" name="addReservation" value="Add">
                			Create Reservation
                		</button>
                	</form>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
    <!--  User Flash Messages -->
    <c:choose>
    <c:when test="${actionResult != null}">
	   <c:choose>
	   		<c:when test="${actionResult == false}">
	      		<div class="alert alert-danger alter-dismissable fade show" role="alert">
              		There was an error! Please verify the validity of your data!
              		<button type="button" class="close" data-dismiss="alert">
                		<span aria-hidden="true">&times;</span>
              		</button>
            	</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-success alter-dismissable fade show" role="alert">
              		Reservation succesfully deleted!
              		<button type="button" class="close" data-dismiss="alert">
                		<span aria-hidden="true">&times;</span>
              		</button>
            	</div>
			</c:otherwise>	
	   </c:choose>
	</c:when>
	<c:otherwise>
	</c:otherwise>	
	</c:choose>		
    
	<h1 align="center"> All Rooms </h1>
	<!-- Data Table -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">Reservation ID</th>
				<th scope="col">Room ID</th>
				<th scope="col">Room Number</th>
				<th scope="col">Client ID</th>
				<th scope="col">Client Name</th>
				<th scope="col">Client Surname</th>
				<th scope="col">Start Date</th>
				<th scope="col">End Date</th>
				<th scope="col">Parking</th>
				<th scope="col">Breakfast</th>
				<th scope="col">Dinner</th>
				<th scope="col">Price</th>
				<th scope="col">Room Info</th>
				<th scope="col">Client Info</th>
				<th scope="col">Reservation Info</th>
				<th scope="col">Delete Reservation</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="reservation" items="${reservationPool}">
				<tr>
					<!-- Reservation DATA -->
					<td> ${reservation.reservationID} </td>
					<td> ${reservation.reservationRoom.roomId} </td>
					<td> ${reservation.reservationRoom.roomNumber} </td>
					<td> ${reservation.reservationClient.clientID} </td>
					<td> ${reservation.reservationClient.clientName} </td>
					<td> ${reservation.reservationClient.clientSurname} </td>
					<td> ${reservation.reservationStartDate} </td>
					<td> ${reservation.reservationEndDate} </td>
					<td> ${reservation.reservationParking} </td>
					<td> ${reservation.reservationBreakfast} </td>
					<td> ${reservation.reservationDinner} </td>
					<td> ${reservation.reservationTotalPrice} </td>
					
					<!-- Edit/Delete Buttons -->
					<td>
						<form action="RoomController" method="POST">
							<button type="submit" class="btn btn-primary" name="editRoom" value="${reservation.reservationRoom.roomId}">
	      						Edit Room
	    					</button>
						</form>
					</td>
					<td>
						<form action="ClientController" method="POST">
							<button type="submit" class="btn btn-primary" name="editClient" value="${reservation.reservationClient.clientID}">
	      						Edit Client
	    					</button>
						</form>
					</td>
					<td>
						<form action="ReservationController" method="POST">
							<button type="submit" class="btn btn-primary" name="editReservation" value="${reservation.reservationID}">
	      						Edit Reservation
	    					</button>
						</form>
					</td>
					<td>
						<form action="ReservationController" method="POST">
							<button type="submit" class="btn btn-danger" name="deleteReservation" value="${reservation.reservationID}">
	      						Delete Reservation
	    					</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	
	<!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>