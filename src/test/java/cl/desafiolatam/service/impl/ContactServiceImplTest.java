package cl.desafiolatam.service.impl;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;

import java.util.logging.Logger;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import cl.desafiolatam.model.Contact;

class ContactServiceImplTest {

	private Contact contacto = new Contact();
	private ContactServiceImpl service = 
			mock(ContactServiceImpl.class);
	
	private static final Logger logger = Logger.getLogger("cl.desafiolatam.service.impl.ContactServiceImplTest");

	Contact antonio = new Contact(1, "Antonio", "Aviles", "Cuevas", "Emiliano zapata",88832231);

	@Test
	@DisplayName("Test Lista Vacia")
	void ListaVacia() {
		logger.info("info test lista de contactos");
		assertEquals(0,service.getContactList().size());
	}
	
	@Test
	@DisplayName("Test para añadir contactos")
	public void AñadirContacto(Contact contacto) {
		try {
			service.addContacto(contacto);
		} catch (Exception e) {
			System.err.print(e);
		}
	}

}
