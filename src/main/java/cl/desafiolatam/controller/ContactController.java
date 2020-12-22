package cl.desafiolatam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cl.desafiolatam.model.Contact;
import cl.desafiolatam.service.ContactService;

@Controller
@ComponentScan
public class ContactController {

	@Autowired
	ContactService servicio;

	@Autowired
	Contact contact;

	@GetMapping(value = "/")
	public String getList(@ModelAttribute("Contact") Contact contact, ModelMap model) {
		model.addAttribute("listaContacto", servicio.getContactList());
		return "/initContactManager";
	}

	@PostMapping(value = "/initContactManager")
	public String initContact(@ModelAttribute("Contact") Contact persona, ModelMap model) {
		servicio.addContacto(persona);
		model.addAttribute("listaContacto", servicio.getContactList());

		return "/initContactManager";
	}

	@GetMapping(value = "eliminarContacto")
	public String eliminaPersona(@ModelAttribute("Contact") Contact persona, @RequestParam(name = "id") int id,
			ModelMap model) {
		servicio.deleteContacto(persona, id);
		model.put("listaContacto", servicio.getContactList());
		return "/initContactManager";

	}

}
