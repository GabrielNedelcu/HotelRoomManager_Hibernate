package pojo;

import java.util.Date;

import java.util.HashSet;
import java.util.Set;


public class Room  implements java.io.Serializable {
	
	private Integer roomId;
	private Integer roomNumber;
	private Integer roomFloor;
	private Double 	roomPrice;
	private String 	roomType;
	private Boolean roomSmoking;
	private Date	roomNextAvaliableDate;
	
	private Set 	reservations = new HashSet(0);

	/*
	 * Construction
	 */
	
	/* Default constructor */
	
	public Room() {
		this.setRoomId(0);                
		this.setRoomNumber(0);            
		this.setRoomFloor(0);             
		this.setRoomPrice(0.0);             
		this.setRoomType("");              
		this.setRoomSmoking(false);           
		this.setRoomNextAvaliableDate(new Date()); 
	}
	
	/**
	 * Parametric constructor
	 * @param pRoomId - the ID associated to the room
	 * @param pRoomNumber - the number of the room
	 * @param pRoomFloor - the floor of the room
	 * @param pRoomPrice - the price per night of the room
	 * @param pRoomType - room type
	 * @param pRoomSmoking - whether you can smoke or not in the room
	 * @param pRoomNextAvaliableDate - the next avaliable date for a reservation
	 */
	
	public Room(Integer pRoomId, Integer pRoomNumber, Integer pRoomFloor,            
				Double pRoomPrice, String pRoomType, Boolean pRoomSmoking,          
				Date pRoomNextAvaliableDate, Set pReservations) {
		this.setRoomId(pRoomId);                
		this.setRoomNumber(pRoomNumber);            
		this.setRoomFloor(pRoomFloor);             
		this.setRoomPrice(pRoomPrice);             
		this.setRoomType(pRoomType);              
		this.setRoomSmoking(pRoomSmoking);           
		this.setRoomNextAvaliableDate(pRoomNextAvaliableDate);
		this.setReservations(pReservations);
	}
	
	
	/*
	 * Setters & Getters
	 */
	
	
	/**
	 * @return the roomId
	 */
	public Integer getRoomId() {
		return roomId;
	}

	/**
	 * @param roomId the roomId to set
	 */
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	/**
	 * @return the roomNumber
	 */
	public Integer getRoomNumber() {
		return roomNumber;
	}

	/**
	 * @param roomNumber the roomNumber to set
	 */
	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
	}

	/**
	 * @return the roomPrice
	 */
	public Double getRoomPrice() {
		return roomPrice;
	}

	/**
	 * @param roomPrice the roomPrice to set
	 */
	public void setRoomPrice(Double roomPrice) {
		this.roomPrice = roomPrice;
	}

	/**
	 * @return the roomFloor
	 */
	public Integer getRoomFloor() {
		return roomFloor;
	}

	/**
	 * @param roomFloor the roomFloor to set
	 */
	public void setRoomFloor(Integer roomFloor) {
		this.roomFloor = roomFloor;
	}

	/**
	 * @return the roomType
	 */
	public String getRoomType() {
		return roomType;
	}

	/**
	 * @param roomType the roomType to set
	 */
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	/**
	 * @return the roomSmoking
	 */
	public Boolean getRoomSmoking() {
		return roomSmoking;
	}

	/**
	 * @param roomSmoking the roomSmoking to set
	 */
	public void setRoomSmoking(Boolean roomSmoking) {
		this.roomSmoking = roomSmoking;
	}

	/**
	 * @return the roomNextAvaliableDate
	 */
	public Date getRoomNextAvaliableDate() {
		return roomNextAvaliableDate;
	}

	/**
	 * @param roomNextAvaliableDate the roomNextAvaliableDate to set
	 */
	public void setRoomNextAvaliableDate(Date roomNextAvaliableDate) {
		this.roomNextAvaliableDate = roomNextAvaliableDate;
	}

	/**
	 * @return the reservations
	 */
	public Set getReservations() {
		return reservations;
	}

	/**
	 * @param reservations the reservations to set
	 */
	public void setReservations(Set reservations) {
		this.reservations = reservations;
	}
}
