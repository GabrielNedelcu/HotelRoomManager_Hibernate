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
	<title>Room Profile</title>
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
              		Room succesfully updated!
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
    
	<div class = "container">
		<form class="row g-3 needs-validation" action="RoomController" method="GET" >
			<h1 align="center">Room ${roomData.roomNumber} Profile</h1>
			
			<!-- Room Number -->
			
			<div class="row mb-3">
				<label for="roomNumber" class="col-sm-2 col-form-label">Room Number</label>
			  	<div class="col-sm-10">
			    	<input
			      		type="number"
			      		class="form-control"
			      		id="roomNumber"
			      		name="roomNumber"
			      		value = "${roomData.roomNumber}"
			      		required
			    	/>
			    	<div class="invalid-feedback">
			      		Please enter the room's number!
			    	</div>
			  	</div>
			</div>
			
			<!-- Room's Price per night -->
			
			<div class="row mb-3">
			  	<label for="inputPrice" class="col-sm-2 col-form-label"> Price per night </label>
			  	<div class="col-sm-10">
			    	<div class="input-group">
			      		<span class="input-group-text">$</span>
			      		<input
			        		type="double"
			        		class="form-control"
			        		id="inputPrice"
			        		name="roomPrice"
			        		value = "${roomData.roomPrice}"
			        		required
			      		/>
			      		<span class="input-group-text">.00</span>
			      		<div class="invalid-feedback">
			        		Please enter the room's price per night!
			      		</div>
			    	</div>
			  	</div>
			</div>
			
			<!-- Floor Combo Box -->
			
			<div class="row mb-3">
				<label for="inputClient" class="col-sm-2 col-form-label">Floor</label>
				<div class="col-sm-10">
					<select
	        			class="form-select"
	        			aria-label="Default select example"
	        			name = "roomFloor"
	        			required >
	      				<c:forEach var="floor" items="${floorsList}" varStatus="loop">
	      					<c:choose>
	      						<c:when test="${loop.index + 1 == roomData.roomFloor}">
	      							<option value = ${loop.index + 1} selected> ${floor} </option>
								</c:when>
								<c:otherwise>
									<option value = ${loop.index + 1}> ${floor} </option>
								</c:otherwise>
	      					</c:choose>
	      				</c:forEach>
	      			</select>
	      			<div class="invalid-feedback">
	        			Please enter a valid input!
	      			</div>
				</div>
			</div>
			
			<!-- Room Type Combo Box -->
			  
			<div class="row mb-3">
				<label for="inputClient" class="col-sm-2 col-form-label">Room Type</label>
				<div class="col-sm-10">
					<select
	        			class="form-select"
	        			aria-label="Default select example"
	        			name = "roomType"
	        			required >
	      				<c:forEach var="type" items="${roomTypeList}" varStatus="loop">
	      					<c:choose>
	      						<c:when test="${loop.index + 1 == roomData.roomType}">
	      							<option value = ${loop.index + 1} selected> ${type} </option>
								</c:when>
								<c:otherwise>
									<option value = ${loop.index + 1}> ${type} </option>
								</c:otherwise>
	      					</c:choose>
	      				</c:forEach>
	      			</select>
	      			<div class="invalid-feedback">
	        			Please enter a valid input!
	      			</div>
				</div>
			</div>
			<!-- Some space between controls-->
			
			<h1></h1>
			
			<!-- Smoking allowed checkbox -->
			
			
			<div class="row mb-3">
			  	<div class="col-sm-10 offset-sm-2">
			    	<div class="form-check">
			    		<c:choose>
	      						<c:when test="${roomData.roomSmoking == true}">
	      							<input
			        					class="form-check-input"
			        					type="checkbox"
			        					id="smokingCheck"
			        					name="canSmoke" 
			        					checked />
								</c:when>
								<c:otherwise>
									<input
			        					class="form-check-input"
			        					type="checkbox"
			        					id="smokingCheck"
			        					name="canSmoke" />
								</c:otherwise>
	      					</c:choose>
			      		
			      		<label class="form-check-label" for="smokingCheck">
			        		Smoking Allowed
			      		</label>
			    	</div>
			  	</div>
			</div>
			
			<!-- "Add the new room" Button -->
			
			 <div class="col-12">
			    <button type="submit" class="btn btn-primary mx-auto d-block" name="updateRoom" value="${roomData.roomId}">
			      Update Room
			    </button>
			  </div>
		</form>
		
		<!-- 
		<form action="RoomController" method="POST">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="showAllRooms" value="Show">
			      	View All Rooms
			    </button>
		  	</div>
	  	</form>
	  	-->
	  	
	  	<div class="row justify-content-md-center">
    		<div class="col-8">
      			<h1></h1>
      			<h1></h1>
      			<h1 align="center">Reservation History</h1>
      			<h1></h1>
      			<h1></h1>
      			<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Reservation ID</th>
							<th scope="col">Client Name</th>
							<th scope="col">Client Surname</th>
							<th scope="col">Client Phone Number</th>
							<th scope="col">Start Date</th>
							<th scope="col">End Date</th>
							<th scope="col">View Reservation Details</th>
							<th scope="col">Delete Record</th>
						</tr>
					</thead>
				
					<tbody>
						<c:forEach var="reservation" items="${reservationHistyory}">
							<tr>
								<!-- Client DATA -->
								<td> ${reservation.reservationID} </td>
								<td> ${reservation.reservationClient.clientName} </td>
								<td> ${reservation.reservationClient.clientSurname} </td>
								<td> ${reservation.reservationClient.clientPhone} </td>
								<td> ${reservation.reservationStartDate} </td>
								<td> ${reservation.reservationEndDate} </td>
								
								<!-- Edit/Delete Buttons -->
								<td>
									<form action="ReservationController" method="POST">
										<button type="submit" class="btn btn-primary" name="editReservation" value="${reservation.reservationID}">
				      						Edit
				    					</button>
									</form>
								</td>
								<td>
									<form action="ReservationController" method="POST">
										<button type="submit" class="btn btn-danger" name="deleteReservation" value="${reservation.reservationID}">
				      						Delete
				    					</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
    		</div>
  		</div>
	</div>
	<!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>