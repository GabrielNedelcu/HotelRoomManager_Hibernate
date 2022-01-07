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
import org.hibernate.Session;
import org.hibernate.Transaction;

import pojo.Room;
import DAO.RoomDao;

public class RoomDaoImpl implements RoomDao{

	@Override
	public void addRoom(Room pRoom) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* save & commit the new room */
		session.save(pRoom);
		transaction.commit();
		
		/* Close the connection */
		session.close();
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
	public void updateRoom(Integer pRoomId, Integer pRoomNumber, Integer pRoomFloor, Double pRoomPrice,
			String pRoomType, Boolean pRoomSmoking, Date pRoomNextAvaliableDate) {
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
		session.update(room);
		transaction.commit();
		
		/* Close the connection */
		session.close();
	}

	@Override
	public void deleteRoom(Room pRoom) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* delete the room & commit transaction*/
		session.delete(pRoom);
		transaction.commit();
		
		/* Close the connection */
		session.close();
	}
	
}
