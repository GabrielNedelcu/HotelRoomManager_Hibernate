package DAO;

import java.util.List;
import java.util.Date;

import pojo.Client;

public interface ClientDao {
	 public void addClient (Client pClient);
	 public List<Client> printClientData();
	 public void updateClient (Integer pclientID, String pclientName, String	pclientSurname,  
			 				   Date pclientBirthDay, String pclientAdress, Integer pclientCNP,
			 				   String pclientEmail, Integer pclientPhone);
	 public void deleteClient (Client pClient);
	 public Client getClient (Integer pClientID);
}
