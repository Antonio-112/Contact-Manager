package cl.desafiolatam.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cl.desafiolatam.model.Contact;
import cl.desafiolatam.service.ContactService;

@Service("contactService")
public class ContactServiceImpl implements ContactService {

	private List<Contact> listaContacto = new ArrayList<Contact>();

	@Override
	public List<Contact> getContactList() {
		return listaContacto;
	}

	@Override
	public void addContacto(Contact contacto) {

		contacto.setIdPersona(listaContacto.size() + 1); 
		if (contacto.getNombre() != null)listaContacto.add(contacto);
	}

	@Override
	public void deleteContacto(Contact contacto, int id) {
		listaContacto.removeIf(x -> x.getIdPersona() == id);

	}

}
