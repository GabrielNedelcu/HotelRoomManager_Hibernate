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
	<div class = "container">
		<form class="row g-3 needs-validation" action="ReservationController" method="GET" >
			<h1 align="center">Make a new reservation</h1>
			
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
	      					<option value = "${room.roomId}"> ${room.roomNumber} </option>
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
	      					<option value = "${client.clientID}"> ${client.clientName} ${client.clientSurname} </option>
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
			        		<input
			          			class="form-check-input"
			          			type="checkbox"
			          			id="parkingCheck"
			          			name="parking" />
			        		<label class="form-check-label" for="parkingCheck">
			          			Parking Spot
			        		</label>
			      		</div>
			
			      <!-- Breakfast Included -->
			
			      <div class="form-check">
						<input
			          		class="form-check-input"
			          		type="checkbox"
		          			id="breakfastCheck"
			          		name="breakfast" />
			        	<label class="form-check-label" for="breakfastCheck">
			          		Breakfast Included
			        	</label>
			      </div>
			
			      <!--Lunch Included -->
			
			      <div class="form-check">
			        	<input
			          		class="form-check-input"
			          		type="checkbox"
			          		id="lunchCheck"
			          		name="dinner" />
			        	<label class="form-check-label" for="lunchCheck">
			          		Lunch Included
			        	</label>
			      </div>
			  </fieldset>
			</div>
			
			<!-- "Add the new room" Button -->
			
			 <div class="col-12">
			    <button type="submit" class="btn btn-primary mx-auto d-block" name="addReservation" value="Add">
			      Add the new reservation
			    </button>
			  </div>
		</form>
		
		<form action="RoomController" method="POST">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="showAllReservations" value="Show">
			      	View All Reservations
			    </button>
		  	</div>
	  	  </form>
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
</body>
</html>