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
import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.Client;
import pojo.Room;
import pojo.Reservation;
import DAO.ReservationDao;

public class ReservationDaoImpl implements ReservationDao{

	@Override
	public void addReservation(Reservation pReservation) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* save & commit the new reservation */
		session.save(pReservation);
		transaction.commit();
		
		/* Close the connection */
		session.close();
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
	public void updateReservation(Integer pReservationID, Room pReservationRoomID, Client pReservationClientID,
			Date pReservationStartDate, Date pReservationEndDate, Boolean pReservationParking,
			Boolean pReservationBreakfast, Boolean pReservationDinner, Double pReservationTotalPrice) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the reservation with the given id*/
		Reservation reservation = (Reservation) session.load(Reservation.class, pReservationId);
		
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
		session.update(reservation);
		transaction.commit();
		
		/* Close the connection */
		session.close();
		
	}

	@Override
	public void deleteReservation(Reservation pReservation) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* delete the reservation & commit transaction*/
		session.delete(pReservation);
		transaction.commit();
		
		/* Close the connection */
		session.close();
		
	}
	
}
