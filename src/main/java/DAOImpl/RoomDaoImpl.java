/**
 * Implementation of the RoomDao class
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
import DAO.RoomDao;

public class RoomDaoImpl implements RoomDao{

	@Override
	public Boolean addRoom(Room pRoom) {
		Boolean actionResult = false;
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* save & commit the new room */
		try {
			session.save(pRoom);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}
		
		/* Close the connection */
		session.close();
		
		return actionResult;
	}

	@Override
	public List<Room> printRoomData() {
		List<Room> roomsList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Room");
		roomsList = query.list();
		return roomsList;
	}

	@Override
	public Boolean updateRoom(Integer pRoomId, Integer pRoomNumber, Integer pRoomFloor, Double pRoomPrice,
			String pRoomType, Boolean pRoomSmoking, Date pRoomNextAvaliableDate) {
		Boolean actionResult = false;
		
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the room with the given id*/
		Room room = (Room) session.load(Room.class, pRoomId);
		
		/* Set room's new data */
		
		room.setRoomNumber(pRoomNumber);
		room.setRoomFloor(pRoomFloor);
		room.setRoomPrice(pRoomPrice);
		room.setRoomType(pRoomType);
		room.setRoomSmoking(pRoomSmoking);
		room.setRoomNextAvaliableDate(pRoomNextAvaliableDate);
		
		/* Update & commit the changes */
		
		try {
			session.update(room);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}
		
		/* Close the connection */
		session.close();
		
		return actionResult;
	}

	@Override
	public Boolean deleteRoom(Room pRoom) {
		Boolean actionResult = false;
		
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* delete the room & commit transaction*/
		
		try {
			session.delete(pRoom);
			transaction.commit();
			
			actionResult = true;
		} catch (HibernateException hibernateEx) {
		}
		
		/* Close the connection */
		session.close();
		
		return actionResult;
	}
	
	@Override
	public Room getRoom(Integer pRoomID) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the client with the given id*/
		Room room = (Room) session.load(Room.class, pRoomID);
		
		return room;
	}
	
}
