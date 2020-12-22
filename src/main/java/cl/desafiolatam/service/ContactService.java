package cl.desafiolatam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.desafiolatam.model.Contact;

@Service("contactservice")
public interface ContactService {
	
		
	//public static final Contact contact = new Contact();
	
	 List<Contact> getContactList ();
	 void addContacto(Contact contacto);
	 //void deleteContacto(Contact contacto);
	 void deleteContacto(Contact contacto, int id);

}
