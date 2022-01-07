package DAO;

import java.util.List;
import java.util.Date;

import pojo.Room;

public interface RoomDao {
	public void addRoom (Room pRoom);
	public List<Room> printRoomData();
	public void updateRoom (Integer pRoomId, Integer pRoomNumber, Integer pRoomFloor, 
			 				Double pRoomPrice, String pRoomType, Boolean pRoomSmoking,
			 				Date pRoomNextAvaliableDate);
	public void deleteRoom (Room pRoom);
}
