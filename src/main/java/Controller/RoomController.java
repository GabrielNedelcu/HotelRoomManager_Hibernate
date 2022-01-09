package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.RoomDao;
import pojo.Room;
import DAOImpl.RoomDaoImpl;

import DAO.ReservationDao;
import pojo.Client;
import pojo.Reservation;
import DAOImpl.ReservationDaoImpl;

/**
 * Servlet implementation class RoomControler
 */
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Room room = new Room();
	RoomDaoImpl roomManager = new RoomDaoImpl();
	ReservationDaoImpl reservationManager = new ReservationDaoImpl();
	
    /**
     * Default constructor. 
     */
    public RoomController() {
        // TODO Auto-generated constructor stub
    }

    /**
     * Implementation of doGet method
     */
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("addRoom") != null) {
			
			/* Fetch Data from HTML Form*/
			Integer number = java.lang.Integer.parseInt(request.getParameter("roomNumber"));
			Integer floor = java.lang.Integer.parseInt(request.getParameter("roomFloor"));
			Double 	price = java.lang.Double.parseDouble(request.getParameter("roomPrice"));
			String	type = request.getParameter("roomType");
			String checked = request.getParameter("canSmoke");
			Boolean	smoking = false;
			
			if (checked.equals("on"))
				smoking = true;
			 
			
			/* Set the new data to the room */
			room.setRoomFloor(floor);
			room.setRoomNumber(number);
			room.setRoomPrice(price);
			room.setRoomType(type);
			room.setRoomSmoking(smoking);
			
			/* Insert the new room in the db */
			roomManager.addRoom(room);
			RequestDispatcher rd = request.getRequestDispatcher("add_Room.jsp");
			rd.forward(request, response);
		}
		
		if (request.getParameter("updateRoom") != null) {
			Integer roomID = java.lang.Integer.parseInt(request.getParameter("updateRoom"));
	
			/* Fetch Data from HTML Form*/
			Integer number = java.lang.Integer.parseInt(request.getParameter("roomNumber"));
			Integer floor = java.lang.Integer.parseInt(request.getParameter("roomFloor"));
			Double 	price = java.lang.Double.parseDouble(request.getParameter("roomPrice"));
			String	type = request.getParameter("roomType");
			String checked = request.getParameter("canSmoke");
			Boolean	smoking = false;
			
			if(checked != null)
				if (checked.equals("on"))
					smoking = true;
			 
			
			/* Update */
			roomManager.updateRoom(roomID, number, floor, price, type, smoking, null);
			
			/* Get Updated Data and Refresh the page*/
			Room pRoom = roomManager.getRoom(roomID);
			
			/* Get all the reservations made in this room */
			java.util.Set reservationsPool = pRoom.getReservations();
			
			List<String> floorsLis = Arrays.asList("1", "2", "3", "4", "5");
			List<String> roomTypeList = Arrays.asList("Single", "Double", "Queen", "King", "Twin", "Suite", "Appartament");
			
			request.setAttribute("roomTypeList", roomTypeList);
			request.setAttribute("floorsList", floorsLis);
			request.setAttribute("roomData", pRoom);
			request.setAttribute("reservationHistyory", reservationsPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("profile_Room.jsp");
			rd.forward(request, response);
		}
	}

    /**
     * Implementation of doPost method
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Show the table containing all the rooms*/
		
		if (request.getParameter("showAllRooms") != null) {
			List<Room> roomPool = new ArrayList();
			roomPool = roomManager.printRoomData();
			request.setAttribute("roomPool", roomPool);
			RequestDispatcher rd = request.getRequestDispatcher("table_Rooms.jsp");
			rd.forward(request, response);
		}
		
		/* View Room DATA*/
		
		if (request.getParameter("editRoom") != null) {
			Integer roomID = java.lang.Integer.parseInt(request.getParameter("editRoom"));
			
			/* Get the room with the given ID*/
			Room pRoom = roomManager.getRoom(roomID);
			
			/* Get all the reservations made in this room */
			java.util.Set reservationsPool = pRoom.getReservations();
			
			List<String> floorsLis = Arrays.asList("1", "2", "3", "4", "5");
			List<String> roomTypeList = Arrays.asList("Single", "Double", "Queen", "King", "Twin", "Suite", "Appartament");
			
			request.setAttribute("roomTypeList", roomTypeList);
			request.setAttribute("floorsList", floorsLis);
			request.setAttribute("roomData", pRoom);
			request.setAttribute("reservationHistyory", reservationsPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("profile_Room.jsp");
			rd.forward(request, response);
			
		}
		
		/* Delete room */
		
		if (request.getParameter("deleteRoom") != null) {
			Integer roomID = java.lang.Integer.parseInt(request.getParameter("deleteRoom"));
			
			/* Delete the room*/
			room.setRoomId(roomID);
			roomManager.deleteRoom(room);
			
			/* Get Updated DATA*/
			List<Room> roomPool = new ArrayList();
			roomPool = roomManager.printRoomData();
			request.setAttribute("roomPool", roomPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("table_Rooms.jsp");
			rd.forward(request, response);
		}
	}

}
