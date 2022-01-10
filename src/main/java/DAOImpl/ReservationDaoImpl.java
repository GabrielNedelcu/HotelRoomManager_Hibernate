/**
 * Implementation of the ReservationDao class
 * 
 * @author Gabriel
 * 
 */

package DAOImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.Client;
import pojo.Room;
import pojo.Reservation;
import DAO.ReservationDao;

public class ReservationDaoImpl implements ReservationDao{

	@Override
	public Boolean addReservation(Reservation pReservation) {
		Boolean actionResult = false;
		
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* save & commit the new reservation */
		
		try {
			session.save(pReservation);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}
		
		/* Close the connection */
		session.close();
		
		return actionResult;
	}

	@Override
	public List<Reservation> printReservationData() {
		List<Reservation> reservationsList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Reservation");
		reservationsList = query.list();
		return reservationsList;
	}

	@Override
	public Boolean updateReservation(Integer pReservationID, Room pReservationRoomID, Client pReservationClientID,
			Date pReservationStartDate, Date pReservationEndDate, Boolean pReservationParking,
			Boolean pReservationBreakfast, Boolean pReservationDinner, Double pReservationTotalPrice) {
		Boolean actionResult = false;
		
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the reservation with the given id*/
		Reservation reservation = (Reservation) session.load(Reservation.class, pReservationID);
		
		/* Set reservation's new data */
		
		reservation.setReservationClient(pReservationClientID);
		reservation.setReservationRoom(pReservationRoomID);
		reservation.setReservationStartDate(pReservationStartDate);
		reservation.setReservationEndDate(pReservationEndDate);
		reservation.setReservationParking(pReservationParking);
		reservation.setReservationBreakfast(pReservationBreakfast);
		reservation.setReservationDinner(pReservationDinner);
		reservation.setReservationTotalPrice(pReservationTotalPrice);
		
		/* Update & commit the changes */
		
		try {
			session.update(reservation);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}
		
		
		/* Close the connection */
		session.close();
		
		return actionResult;
	}

	@Override
	public Boolean deleteReservation(Reservation pReservation) {
		Boolean actionResult = false;
		
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* delete the reservation & commit transaction*/
		
		try {
			session.delete(pReservation);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}

		/* Close the connection */
		session.close();
		
		return actionResult;
	}
	
	@Override
	public Reservation getReservation (Integer pReservationID) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the reservation with the given id*/
		Reservation reservation = (Reservation) session.load(Reservation.class, pReservationID);
		
		return reservation;
	}
	
}
