package DAO;

import java.util.List;
import java.util.Date;

import pojo.Client;
import pojo.Room;

public interface RoomDao {
	public Boolean addRoom (Room pRoom);
	public List<Room> printRoomData();
	public Boolean updateRoom (Integer pRoomId, Integer pRoomNumber, Integer pRoomFloor, 
			 				Double pRoomPrice, String pRoomType, Boolean pRoomSmoking,
			 				Date pRoomNextAvaliableDate);
	public Boolean deleteRoom (Room pRoom);
	public Room getRoom(Integer pRoomID);
}
