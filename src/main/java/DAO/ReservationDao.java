package DAO;

import java.util.List;
import java.util.Date;

import pojo.Client;
import pojo.Reservation;
import pojo.Room;

public interface ReservationDao {
	public void addReservation (Reservation pReservation);
	public List<Reservation> printReservationData();
	public void updateReservation (Integer pReservationID, Room pReservationRoomID, Client pReservationClientID,            
								   Date pReservationStartDate, Date pReservationEndDate, Boolean pReservationParking,       
								   Boolean pReservationBreakfast, Boolean pReservationDinner, Double pReservationTotalPrice);
	public void deleteReservation (Reservation pReservation);
}
