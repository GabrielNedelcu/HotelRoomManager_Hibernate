package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	}

    /**
     * Implementation of doPost method
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
