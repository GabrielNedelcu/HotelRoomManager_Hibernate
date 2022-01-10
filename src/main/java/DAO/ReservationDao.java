package DAO;

import java.util.List;
import java.util.Date;

import pojo.Client;
import pojo.Reservation;
import pojo.Room;

public interface ReservationDao {
	public Boolean addReservation (Reservation pReservation);
	public List<Reservation> printReservationData();
	public Boolean updateReservation (Integer pReservationID, Room pReservationRoomID, Client pReservationClientID,            
								   Date pReservationStartDate, Date pReservationEndDate, Boolean pReservationParking,       
								   Boolean pReservationBreakfast, Boolean pReservationDinner, Double pReservationTotalPrice);
	public Boolean deleteReservation (Reservation pReservation);
	public Reservation getReservation (Integer pReservationID);
}
