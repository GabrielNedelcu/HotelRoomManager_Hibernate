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
	
	<title>Insert a Room</title>
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
    
    
	<div class = "container">
		<form class="row g-3 needs-validation" novalidate action="ReservationController" method="GET" >
			<h1 align="center">Reservation details</h1>
			
			<!-- Room ComboBox -->

  			<div class="row mb-3">
				<label for="inputClient" class="col-sm-2 col-form-label">Room number</label>
				<div class="col-sm-10">
					<select
	        			class="form-select"
	        			aria-label="Default select example"
	        			name = roomID
	        			required >
	        			<option selected disabled value="">Select ...</option>
	      				<c:forEach var="room" items="${roomPool}">
	      					<c:choose>
	      						<c:when test="${room.roomId == reservationData.reservationRoom.roomId}">
	      							<option value = "${room.roomId}" selected> ${room.roomNumber} </option>
								</c:when>
								<c:otherwise>
									<option value = "${room.roomId}"> ${room.roomNumber} </option>
								</c:otherwise>
	      					</c:choose>
	      				</c:forEach>
	      			</select>
	      			<div class="invalid-feedback">
	        			Please enter a valid input!
	      			</div>
				</div>
			</div>

  			<!-- Clients ComboBox -->

 	 		<div class="row mb-3">
				<label for="inputClient" class="col-sm-2 col-form-label">Client</label>
				<div class="col-sm-10">
					<select
	        			class="form-select"
	        			aria-label="Default select example"
	        			name = "clientID"
	        			required >
	        			<option selected disabled value="">Select ...</option>
	      				<c:forEach var="client" items="${clientPool}">
	      					<c:choose>
	      						<c:when test="${client.clientID == reservationData.reservationClient.clientID}">
	      							<option value = "${client.clientID}" selected> ${client.clientName} ${client.clientSurname} </option>
								</c:when>
								<c:otherwise>
									<option value = "${client.clientID}"> ${client.clientName} ${client.clientSurname} </option>
								</c:otherwise>
	      					</c:choose>
	      				</c:forEach>
	      			</select>
	      			<div class="invalid-feedback">
	        			Please enter a valid input!
	      			</div>
				</div>
			</div>

  			<!-- Start Date-->

  			<div class="row mb-3">
    			<label for="inputDoB" class="col-sm-2 col-form-label">Start Date</label>
    			<div class="col-sm-10">
      				<input
	        			type="text"
	        			class="form-control"
	        			id="inputStartDate"
	        			placeholder="12/02/2021"
	        			name="startDate"
	        			value = "${reservationData.reservationStartDate}"
	        			required />
		      		<div class="invalid-feedback">
		        		Please enter a valid date!
		      		</div>
    			</div>
  			</div>

			<!-- End Date-->
			
			<div class="row mb-3">
				<label for="inputDoB" class="col-sm-2 col-form-label">End Date</label>
			  	<div class="col-sm-10">
			    	<input
			      		type="text"
			      		class="form-control"
			      		id="inputEndDate"
			      		placeholder="12/02/2021"
			      		value = "${reservationData.reservationEndDate}"
			      		name="endDate"
			      		required />
			    	<div class="invalid-feedback">
			      		Please enter a valid date!
			    	</div>
			  	</div>
			</div>

			<!-- Additional Options Checkboxes -->
			
			<div class="col-12">
			  	<fieldset class="row mb-3">
			    	<legend class="col-form-label col-sm-2 pt-0">Additional Options</legend>
			
			    	<!-- Parking spot included -->
			
			    	<div class="col-sm-10">
			      		<div class="form-check">
				      		<c:choose>
		      				 	<c:when test="${reservationData.reservationParking == true}">
		      						<input
			          					class="form-check-input"
			          					type="checkbox"
			          					id="parkingCheck"
			          					name="parking" 
			          					checked/>
								</c:when>
								<c:otherwise>
									<input
			          					class="form-check-input"
			          					type="checkbox"
			          					id="parkingCheck"
			          					name="parking" />
								</c:otherwise>
		      				</c:choose>
			        		<label class="form-check-label" for="parkingCheck">
			          			Parking Spot
			        		</label>
			      		</div>
			
			      <!-- Breakfast Included -->
			
			      <div class="form-check">
			      		<c:choose>
		      				 	<c:when test="${reservationData.reservationBreakfast == true}">
		      						<input
			          					class="form-check-input"
			          					type="checkbox"
		          						id="breakfastCheck"
			          					name="breakfast" 
			          					checked />
								</c:when>
								<c:otherwise>
									<input
			          					class="form-check-input"
			          					type="checkbox"
		          						id="breakfastCheck"
			          					name="breakfast" />
								</c:otherwise>
		      				</c:choose>
			        	<label class="form-check-label" for="breakfastCheck">
			          		Breakfast Included
			        	</label>
			      </div>
			
			      <!--Lunch Included -->
			
			      <div class="form-check">
			      		<c:choose>
		      				 	<c:when test="${reservationData.reservationBreakfast == true}">
		      						<input
			          					class="form-check-input"
			          					type="checkbox"
			          					id="lunchCheck"
			          					name="dinner"
			          					checked />
								</c:when>
								<c:otherwise>
									<input
			          					class="form-check-input"
			          					type="checkbox"
			          					id="lunchCheck"
			          					name="dinner" />
								</c:otherwise>
		      				</c:choose>
			        	
			        	<label class="form-check-label" for="lunchCheck">
			          		Lunch Included
			        	</label>
			      </div>
			      </div>
			  </fieldset>
			</div>
			
			<!-- "Add the new room" Button -->
			
			 <div class="col-12">
			    <button type="submit" class="btn btn-primary mx-auto d-block" name="updateReservation" value="${reservationData.reservationID}">
			      Update data
			    </button>
			  </div>
		</form>
		
		<!--
		<form action="ReservationController" method="POST">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="showAllReservations" value="${reservationData.reservationID}">
			      	View All Reservations
			    </button>
		  	</div>
	  	  </form>
	  	 -->
	  	 
	</div>
	
	<script>
  		$("#inputStartDate").datepicker({
    		uiLibrary: "bootstrap4",
  			});
	</script>

	<script>
  		$("#inputEndDate").datepicker({
    		uiLibrary: "bootstrap4",
  		});
	</script>
	<!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
   <script src="form_validation.js"> </script>
</body>
</html>