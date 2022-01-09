package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import DAOImpl.HibernateUtil;


import DAO.ReservationDao;
import pojo.Reservation;
import DAOImpl.ReservationDaoImpl;

import DAO.ClientDao;
import pojo.Client;
import DAOImpl.ClientDaoImpl;

import DAO.RoomDao;
import pojo.Room;
import DAOImpl.RoomDaoImpl;

/**
 * Servlet implementation class ReservationController
 */
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Reservation reservation = new Reservation();
	ReservationDaoImpl reservationManager = new ReservationDaoImpl();
	ClientDaoImpl clientManager = new ClientDaoImpl();
	RoomDaoImpl roomManager = new RoomDaoImpl();
	
    /**
     * Default constructor. 
     */
    public ReservationController() {
        // TODO Auto-generated constructor stub
    }

    /**
     * Implementation of doGet method
     */
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	if (request.getParameter("addReservation") != null) {
    		
    		if (request.getParameter("roomID") == null || request.getParameter("clientID") == null )
    		{
    			/* Invalid Data - NOTHING TO DO */
    			/* initialize the data, reload page */
    			
    			/* Get all the clients */
    			List<Client> clientPool = new ArrayList();
    			clientPool = clientManager.printClientData();
    			
    			/* Get all the rooms */
    			List<Room> roomPool = new ArrayList();
    			roomPool = roomManager.printRoomData();
    			
    			request.setAttribute("roomPool", roomPool);
    			request.setAttribute("clientPool", clientPool);
    			
    			RequestDispatcher rd = request.getRequestDispatcher("add_Reservation.jsp");
    			rd.forward(request, response);
    			
    			return;
    		}
    		/* Fetch Data from HTML Form*/
    		
    		Integer roomID = java.lang.Integer.parseInt(request.getParameter("roomID"));
    		Integer clientID = java.lang.Integer.parseInt(request.getParameter("clientID"));
    		
    		Session session = HibernateUtil.getSessionFactory().openSession();
    		
    		Room room = (Room) session.get(Room.class, roomID);
    		Client client = (Client) session.get(Client.class, clientID);
    		
    		/* Fetch and convert the start date */
    		String strStartDate = request.getParameter("startDate");
			Date startDate = null;
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			try {
				startDate = df.parse(strStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			/* Fetch and convert the end date */
    		String strEndDate = request.getParameter("endDate");
			Date endDate = null;
			try {
				endDate = df.parse(strEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String checked;
			
			Boolean	parking = false;
			checked = request.getParameter("parking");
			if (checked != null)
				if (checked.equals("on"))
					parking = true;
			
			Boolean	breakfast = false;
			checked = request.getParameter("breakfast");
			if (checked != null)
				if (checked.equals("on"))
					breakfast = true;
			
			Boolean	dinner = false;
			checked = request.getParameter("dinner");
			if (checked != null)
				if (checked.equals("on"))
					dinner = true;
			
			/* Set the data to the reservation */
			reservation.setReservationClient(client);
			reservation.setReservationRoom(room);
			reservation.setReservationStartDate(startDate);
			reservation.setReservationEndDate(endDate);
			reservation.setReservationParking(parking);
			reservation.setReservationBreakfast(breakfast);
			reservation.setReservationDinner(dinner);
			
			/* Set the total price of the reservation */
			LocalDate startLocalDate = startDate.toInstant()
				      .atZone(ZoneId.systemDefault())
				      .toLocalDate();
			LocalDate endLocalDate = endDate.toInstant()
				      .atZone(ZoneId.systemDefault())
				      .toLocalDate();
			long daysBetween = ChronoUnit.DAYS.between(startLocalDate, endLocalDate);
			
			reservation.setReservationTotalPrice(daysBetween * room.getRoomPrice());
			
			/* Insert the new reservation in the db */
			reservationManager.addReservation(reservation);
			
			/* Get all the clients */
			List<Client> clientPool = new ArrayList();
			clientPool = clientManager.printClientData();
			
			/* Get all the rooms */
			List<Room> roomPool = new ArrayList();
			roomPool = roomManager.printRoomData();
			
			request.setAttribute("roomPool", roomPool);
			request.setAttribute("clientPool", clientPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("add_Reservation.jsp");
			rd.forward(request, response);
    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("showAllReservations") != null) {
			List<Reservation> reservationPool = new ArrayList();
			reservationPool = reservationManager.printReservationData();
			request.setAttribute("reservationPool", reservationPool);
			RequestDispatcher rd = request.getRequestDispatcher("table_Reservations.jsp");
			rd.forward(request, response);
		}
	}

}
