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
	
	<title>Insert a Room</title>
</head>
<body>
	<div class = "container">
		<form class="row g-3 needs-validation" action="RoomController" method="GET" >
			<h1 align="center">Add a room</h1>
			
			<!-- Room Number -->
			
			<div class="row mb-3">
				<label for="roomNumber" class="col-sm-2 col-form-label">Room Number</label>
			  	<div class="col-sm-10">
			    	<input
			      		type="number"
			      		class="form-control"
			      		id="roomNumber"
			      		name="roomNumber"
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
			        		type="number"
			        		class="form-control"
			        		id="inputPrice"
			        		name="roomPrice"
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
	      				<option selected disabled value="">Select ...</option>
	      				<option value = "1"> 1 </option>
	      				<option value = "2"> 2 </option>
	      				<option value = "3"> 3 </option>
	      				<option value = "4"> 4 </option>
	      				<option value = "5"> 5 </option>
	      			</select>
	      			<div class="invalid-feedback">
	        			Please enter a valid input!
	      			</div>
				</div>
			</div>
			
			<!-- Room Type Combo Box -->
			  
			<div class="row mb-3">
				<label for="inputClient" class="col-sm-2 col-form-label"> Room Type </label>
				<div class="col-sm-10">
					<select
		        		class="form-select"
		        		aria-label="Default select example"
		        		name = "roomType"
		        		required >
		      			<option selected disabled value="">Select ...</option>
		      			<option value = "1"> Single </option>
		      			<option value = "2"> Double </option>
		      			<option value = "3"> Queen </option>
		      			<option value = "4"> King </option>
		      			<option value = "5"> Twin </option>
		      			<option value = "6"> Suite </option>
		      			<option value = "7"> Appartament </option>
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
			      		<input
			        		class="form-check-input"
			        		type="checkbox"
			        		id="smokingCheck"
			        		name="canSmoke"
			      		/>
			      		<label class="form-check-label" for="smokingCheck">
			        		Smoking Allowed
			      		</label>
			    	</div>
			  	</div>
			</div>
			
			<!-- "Add the new room" Button -->
			
			 <div class="col-12">
			    <button type="submit" class="btn btn-primary mx-auto d-block" name="addRoom" value="Add">
			      Add the new room
			    </button>
			  </div>
		</form>
		
		<form action="RoomController" method="POST">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="showAllRooms" value="Show">
			      	View All Rooms
			    </button>
		  	</div>
	  	  </form>
	  	  
	  	  <form action="ReservationController" method="GET">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="addReservation" value="Show">
			      	Make a new reservation
			    </button>
		  	</div>
	  	  </form>
	</div>
	<!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>