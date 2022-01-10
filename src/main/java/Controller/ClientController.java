package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Set;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import DAO.ClientDao;
import pojo.Client;
import DAOImpl.ClientDaoImpl;

import DAO.ReservationDao;
import pojo.Reservation;
import DAOImpl.ReservationDaoImpl;

/**
 * Servlet implementation class ClientController
 */
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Client client = new Client();
	ClientDaoImpl clientManager = new ClientDaoImpl();
	ReservationDaoImpl reservationManager = new ReservationDaoImpl();
	
    /**
     * Default constructor. 
     */
    public ClientController() {

    }
    
    /**
     * Implementation of doGet method
     */
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("addClient") != null) {
			
			if (request.getParameter("name") == null) {
				/* Invalid Data - NOTHING TO DO */
    			/* initialize the data, reload page */
				
				RequestDispatcher rd = request.getRequestDispatcher("add_Client.jsp");
				rd.forward(request, response);
				
				return;
			}
			/* Fetch Data from HTML Form*/
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String b = request.getParameter("birthday");
			Date birthDay = null;
			/* Fetch and convert the date */
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			try {
				birthDay = df.parse(b);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String address = request.getParameter("address");
			Integer cnp = java.lang.Integer.parseInt(request.getParameter("cnp"));
			String email = request.getParameter("email");
			Integer phone = java.lang.Integer.parseInt(request.getParameter("phone"));
			
			/* Set the new data to the client */
			client.setClientName(name);
			client.setClientSurname(surname);
			client.setClientBirthDay(birthDay);
			client.setClientAddress(address);
			client.setClientCNP(cnp);
			client.setClientEmail(email);
			client.setClientPhone(phone);
			
			/* Insert the new client in the db */
			Boolean bResult = clientManager.addClient(client);
			
			request.setAttribute("actionResult", bResult);
			RequestDispatcher rd = request.getRequestDispatcher("add_Client.jsp");
			rd.forward(request, response);
		}
		
		/*Update Client DATA*/
		if (request.getParameter("updateClient") != null) {
			Integer clientID = java.lang.Integer.parseInt(request.getParameter("updateClient"));
			
			/* Fetch Data from HTML Form*/
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String b = request.getParameter("birthday");
			Date birthDay = null;
			/* Fetch and convert the date */
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			try {
				birthDay = df.parse(b);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String address = request.getParameter("address");
			Integer cnp = java.lang.Integer.parseInt(request.getParameter("cnp"));
			String email = request.getParameter("email");
			Integer phone = java.lang.Integer.parseInt(request.getParameter("phone"));
			
			/* Update */
			Boolean bResult = clientManager.updateClient(clientID, name, surname, birthDay, address, cnp, email, phone);
			
			request.setAttribute("actionResult", bResult);

			/* Get Updated Data and Refresh the page*/
			Client pClient = clientManager.getClient(clientID);
			
			java.util.Set reservationsPool = pClient.getReservations();
			
			request.setAttribute("clientData", pClient);
			request.setAttribute("reservationHistyory", reservationsPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("profile_Client.jsp");
			rd.forward(request, response);
		}
	}
    
    /**
     * Implementation of doPost method
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Show the table containing all the clients*/
		
		if (request.getParameter("showAllClients") != null) {
			List<Client> clientPool = new ArrayList();
			clientPool = clientManager.printClientData();
			request.setAttribute("clientPool", clientPool);
			RequestDispatcher rd = request.getRequestDispatcher("table_Clients.jsp");
			rd.forward(request, response);
		}
		
		/* View Client DATA*/
		
		if (request.getParameter("editClient") != null) {
			Integer clientID = java.lang.Integer.parseInt(request.getParameter("editClient"));
			
			Client pClient = clientManager.getClient(clientID);
			
			/*String 
			Date birthDay = null;
			/* Fetch and convert the date 
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			try {
				birthDay = df.parse(pClient.getClientBirthDay());
			} catch (ParseException e) {
				e.printStackTrace();
			}*/
			
			java.util.Set reservationsPool = pClient.getReservations();
			
			request.setAttribute("clientData", pClient);
			request.setAttribute("reservationHistyory", reservationsPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("profile_Client.jsp");
			rd.forward(request, response);
		}
		
		/* Delete Client */
		
		if (request.getParameter("deleteClient") != null) {
			Integer clientID = java.lang.Integer.parseInt(request.getParameter("deleteClient"));
			
			/* Delete the Client*/
			client.setClientID(clientID);
			Boolean bResult = clientManager.deleteClient(client);
			
			request.setAttribute("actionResult", bResult);
			
			/* Get Updated DATA*/
			List<Client> clientPool = new ArrayList();
			clientPool = clientManager.printClientData();
			request.setAttribute("clientPool", clientPool);
			
			RequestDispatcher rd = request.getRequestDispatcher("table_Clients.jsp");
			rd.forward(request, response);
		}
	}

}
