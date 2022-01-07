package pojo;

import java.util.Date;

public class Reservation  implements java.io.Serializable {
	
	private Integer reservationID;
	private Room 	reservationRoom;
	private Client	reservationClient;
	private Date	reservationStartDate;
	private Date	reservationEndDate;
	private Boolean	reservationParking;
	private Boolean	reservationBreakfast;
	private Boolean	reservationDinner;
	private Double	reservationTotalPrice;
	
	/*
	 * Construction
	 */
	
	/* Default constructor */
	
	public Reservation() {
		setReservationID(0);
		setReservationRoom(null);
		setReservationClient(null);
		setReservationStartDate(new Date());
		setReservationEndDate(new Date());
		setReservationParking(false);
		setReservationBreakfast(false);
		setReservationDinner(false);
		setReservationTotalPrice(0.0);
	}
	
	/**
	 * Parametric constructor
	 * @param pReservationID - the id associated to the reservation
	 * @param pReservationRoomID - the id of the room associated to the reservation
	 * @param pReservationClientID - the id of the client associated to the reservation
	 * @param pReservationStartDate - the starting date of the reservation
	 * @param pReservationEndDate - the ending date of the reservation
	 * @param pReservationParking - whether the reservation has parking included or not
	 * @param pReservationBreakfast - whether the reservation has breakfast included or not
	 * @param pReservationDinner - whether the reservation has dinner included or not
	 * @param pReservationTotalPrice - the total cost of the reservation (number of nights * price per night)
	 */
	
	public Reservation(Integer pReservationID, Room pReservationRoomID, Client pReservationClientID,  
					   Date pReservationStartDate, Date pReservationEndDate, Boolean pReservationParking,   
					   Boolean pReservationBreakfast, Boolean pReservationDinner, Double pReservationTotalPrice) {
		setReservationID(pReservationID);
		setReservationRoom(pReservationRoomID);
		setReservationClient(pReservationClientID);
		setReservationStartDate(pReservationStartDate);
		setReservationEndDate(pReservationEndDate);
		setReservationParking(pReservationParking);
		setReservationBreakfast(pReservationBreakfast);
		setReservationDinner(pReservationDinner);
		setReservationTotalPrice(pReservationTotalPrice);
	}
	
	
	/*
	 * Setters & Getters
	 */

	
	/**
	 * @return the reservationID
	 */
	public Integer getReservationID() {
		return reservationID;
	}

	/**
	 * @param reservationID the reservationID to set
	 */
	public void setReservationID(Integer reservationID) {
		this.reservationID = reservationID;
	}

	/**
	 * @return the reservationRoom
	 */
	public Room getReservationRoom() {
		return reservationRoom;
	}

	/**
	 * @param reservationRoom the reservationRoom to set
	 */
	public void setReservationRoom(Room reservationRoom) {
		this.reservationRoom = reservationRoom;
	}

	/**
	 * @return the reservationClient
	 */
	public Client getReservationClient() {
		return reservationClient;
	}

	/**
	 * @param reservationClient the reservationClient to set
	 */
	public void setReservationClient(Client reservationClient) {
		this.reservationClient = reservationClient;
	}

	/**
	 * @return the reservationStartDate
	 */
	public Date getReservationStartDate() {
		return reservationStartDate;
	}

	/**
	 * @param reservationStartDate the reservationStartDate to set
	 */
	public void setReservationStartDate(Date reservationStartDate) {
		this.reservationStartDate = reservationStartDate;
	}

	/**
	 * @return the reservationParking
	 */
	public Boolean getReservationParking() {
		return reservationParking;
	}

	/**
	 * @param reservationParking the reservationParking to set
	 */
	public void setReservationParking(Boolean reservationParking) {
		this.reservationParking = reservationParking;
	}

	/**
	 * @return the reservationEndDate
	 */
	public Date getReservationEndDate() {
		return reservationEndDate;
	}

	/**
	 * @param reservationEndDate the reservationEndDate to set
	 */
	public void setReservationEndDate(Date reservationEndDate) {
		this.reservationEndDate = reservationEndDate;
	}

	/**
	 * @return the reservationBreakfast
	 */
	public Boolean getReservationBreakfast() {
		return reservationBreakfast;
	}

	/**
	 * @param reservationBreakfast the reservationBreakfast to set
	 */
	public void setReservationBreakfast(Boolean reservationBreakfast) {
		this.reservationBreakfast = reservationBreakfast;
	}

	/**
	 * @return the reservationDinner
	 */
	public Boolean getReservationDinner() {
		return reservationDinner;
	}

	/**
	 * @param reservationDinner the reservationDinner to set
	 */
	public void setReservationDinner(Boolean reservationDinner) {
		this.reservationDinner = reservationDinner;
	}

	/**
	 * @return the reservationTotalPrice
	 */
	public Double getReservationTotalPrice() {
		return reservationTotalPrice;
	}

	/**
	 * @param reservationTotalPrice the reservationTotalPrice to set
	 */
	public void setReservationTotalPrice(Double reservationTotalPrice) {
		this.reservationTotalPrice = reservationTotalPrice;
	}
}
