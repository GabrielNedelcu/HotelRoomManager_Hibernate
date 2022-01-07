/**
 * Implementation of the ClientDao class
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

import pojo.Client;
import DAO.ClientDao;

public class ClientDaoImpl implements ClientDao{
	
	@Override
	public void addClient (Client pClient) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* save & commit the new client */
		session.save(pClient);
		transaction.commit();
		
		/* Close the connection */
		session.close();
	}

	@Override
	public List<Client> printClientData() {
		List<Client> clientsList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Client");
		clientsList = query.list();
		return clientsList;

	}

	@Override
	public void updateClient(Integer pclientID, String pclientName, String pclientSurname, Date pclientBirthDay,
							 String pclientAdress, Integer pclientCNP, String pclientEmail, Integer pclientPhone) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* Get the client with the given id*/
		Client client = (Client) session.load(Client.class, pclientID);
		
		/* Set client's new data */
		client.setClientName(pclientName);
		client.setClientSurname(pclientSurname);
		client.setClientBirthDay(pclientBirthDay);
		client.setClientAddress(pclientAdress);
		client.setClientCNP(pclientCNP);
		client.setClientEmail(pclientEmail);
		client.setClientPhone(pclientPhone);
		
		/* Update & commit the changes */
		session.update(client);
		transaction.commit();
		
		/* Close the connection */
		session.close();
	}

	@Override
	public void deleteClient(Client pClient) {
		/* Get session and open transaction */
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		/* delete the client & commit transaction*/
		session.delete(pClient);
		transaction.commit();
		
		/* Close the connection */
		session.close();
	}
}
