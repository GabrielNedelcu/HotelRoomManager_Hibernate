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
	
	<title>Add a client</title>
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
		<h1 align="center">Add a client</h1>
		
	      <form class="row g-3 needs-validation" action="ClientController" method="GET">
		
			  <!-- Client Name -->
			
			  <div class="col-md-6">
			    <label for="inputName" class="form-label">Name</label>
			    <input
			      type="text"
			      class="form-control"
			      id="inputName"
			      name="name"
			      placeholder="Popescu"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid Name!
			    </div>
			  </div>
			
			  <!-- Client Surname -->
			
			  <div class="col-md-6">
			    <label for="inputSurname" class="form-label">Surname</label>
			    <input
			      type="text"
			      class="form-control"
			      id="inputSurname"
			      name="surname"
			      placeholder="Ion"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid Surname!
			    </div>
			  </div>
			
			  <!-- Client Adress -->
			
			  <div class="col-12">
			    <label for="inputAddress" class="form-label">Address</label>
			    <input
			      type="text"
			      class="form-control"
			      id="inputAddress"
			      name="address"
			      placeholder="1234 Main St"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid adress!
			    </div>
			  </div>
			
			  <!-- Client Date Of Birth -->
			
			  <div class="col-12">
			    <label for="inputDoB" class="form-label">Date of Birth</label>
			    <input
			      type="text"
			      class="form-control"
			      id="inputDoB"
			      name="birthday"
			      placeholder="12/02/2021"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter the clien't birthday!
			    </div>
			  </div>
			
			  <!-- Client CNP -->
			
			  <div class="col-12">
			    <label for="inputCNP" class="form-label">Social Security Number</label>
			    <input
			      type="number"
			      class="form-control"
			      id="inputCNP"
			      name="cnp"
			      placeholder="6211201018187"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid CNP!
			    </div>
			  </div>
			
			  <!-- Client Email Adress -->
			
			  <div class="col-12">
			    <label for="inputEmail" class="form-label">Email</label>
			    <input
			      type="email"
			      class="form-control"
			      id="inputEmail"
			      name="email"
			      placeholder="popescu.ion@gmail.com"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid email adress!
			    </div>
			  </div>
			
			  <!-- Client Phone Number-->
			
			  <div class="col-12">
			    <label for="inputPhoneNumber" class="form-label">Phone Number</label>
			    <input
			      type="number"
			      class="form-control"
			      id="inputPhoneNumber"
			      name="phone"
			      placeholder="0714151618"
			      required
			    />
			    <div class="invalid-feedback">
			      Please enter a valid phone number!
			    </div>
			  </div>
			
			  <!-- "Add the new Client" Button -->
			
			  <div class="col-12">
			    <button type="submit" class="btn btn-primary mx-auto d-block" name="addClient" value="Adauga">
			      Add the new client
			    </button>
			  </div>
			  
			  <script>
			    $("#inputDoB").datepicker({
			      uiLibrary: "bootstrap4",
			    });
			  </script>
		  </form>
		  
		  <!--
	  	  <form action="ClientController" method="POST">
	  		<div class="col-12">
		    	<button type="submit" class="btn btn-primary mx-auto d-block" name="showAllClients" value="Show">
			      	View All Clients
			    </button>
		  	</div>
	  	  </form>
	  	   -->
    </div>
   
   <!-- Bootrsap JS bundle-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>