package pojo;

import java.util.Date;

import java.util.HashSet;
import java.util.Set;

public class Client implements java.io.Serializable {
	
	private Integer clientID;
	private String 	clientName;
	private String	clientSurname;
	private	Date	clientBirthDay;
	private String	clientAddress;
	private Long	clientCNP;
	private String	clientEmail;
	private	Long	clientPhone;
	
	private Set 	reservations = new HashSet(0);
	
	/*
	 * Construction
	 */
	
	/* Default constructor */
	
	public Client() {
		this.setClientID(0);
		this.setClientName("");
		this.setClientSurname("");
		this.setClientBirthDay(new Date());
		this.setClientAddress("");
		this.setClientCNP(Long.valueOf(0));
		this.setClientEmail("");
		this.setClientPhone(Long.valueOf(0));
	}
	
	/**
	 * Parametric constructor
	 * @param pclientID - the id of the client
	 * @param pclientName - clien't name
	 * @param pclientSurname - clien't surname
	 * @param pclientBirthDay - clien't birthday date
	 * @param pclientAdress - clien't address
	 * @param pclientCNP - clien't name
	 * @param pclientEmail - clien't email
	 * @param pclientPhone - clien't phone number
	 */
	
	public Client(Integer pclientID, String pclientName, String	pclientSurname, 
				  Date pclientBirthDay, String pclientAdress, Long pclientCNP,
				  String pclientEmail, Long pclientPhone, Set pReservations) {
		this.setClientID(pclientID);
		this.setClientName(pclientName);
		this.setClientSurname(pclientSurname);
		this.setClientBirthDay(pclientBirthDay);
		this.setClientAddress(pclientAdress);
		this.setClientCNP(pclientCNP);
		this.setClientEmail(pclientEmail);
		this.setClientPhone(pclientPhone);
		this.setReservations(pReservations);
	}
	
	
	/*
	 * Setters & Getters
	 */
	
	
	/**
	 * @return the clientID
	 */
	public Integer getClientID() {
		return clientID;
	}

	/**
	 * @param clientID the clientID to set
	 */
	public void setClientID(Integer clientID) {
		this.clientID = clientID;
	}

	/**
	 * @return the clientName
	 */
	public String getClientName() {
		return clientName;
	}

	/**
	 * @param clientName the clientName to set
	 */
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	/**
	 * @return the clientBirthDay
	 */
	public Date getClientBirthDay() {
		return clientBirthDay;
	}

	/**
	 * @param clientBirthDay the clientBirthDay to set
	 */
	public void setClientBirthDay(Date clientBirthDay) {
		this.clientBirthDay = clientBirthDay;
	}

	/**
	 * @return the clientSurname
	 */
	public String getClientSurname() {
		return clientSurname;
	}

	/**
	 * @param clientSurname the clientSurname to set
	 */
	public void setClientSurname(String clientSurname) {
		this.clientSurname = clientSurname;
	}

	/**
	 * @return the clientAdress
	 */
	public String getClientAddress() {
		return clientAddress;
	}

	/**
	 * @param clientAdress the clientAdress to set
	 */
	public void setClientAddress(String clientAdress) {
		this.clientAddress = clientAdress;
	}

	/**
	 * @return the clientEmail
	 */
	public String getClientEmail() {
		return clientEmail;
	}

	/**
	 * @param clientEmail the clientEmail to set
	 */
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	/**
	 * @return the clientPhone
	 */
	public Long getClientPhone() {
		return clientPhone;
	}

	/**
	 * @param clientPhone the clientPhone to set
	 */
	public void setClientPhone(Long clientPhone) {
		this.clientPhone = clientPhone;
	}

	/**
	 * @return the clientCNP
	 */
	public Long getClientCNP() {
		return clientCNP;
	}

	/**
	 * @param clientCNP the clientCNP to set
	 */
	public void setClientCNP(Long clientCNP) {
		this.clientCNP = clientCNP;
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
