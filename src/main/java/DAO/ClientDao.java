package DAO;

import java.util.List;
import java.util.Date;

import pojo.Client;

public interface ClientDao {
	 public Boolean addClient (Client pClient);
	 public List<Client> printClientData();
	 public Boolean updateClient (Integer pclientID, String pclientName, String	pclientSurname,  
			 				   Date pclientBirthDay, String pclientAdress, Long pclientCNP,
			 				   String pclientEmail, Long pclientPhone);
	 public Boolean deleteClient (Client pClient);
	 public Client getClient (Integer pClientID);
}
