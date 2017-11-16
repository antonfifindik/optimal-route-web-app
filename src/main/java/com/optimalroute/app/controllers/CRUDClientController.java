package com.optimalroute.app.controllers;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IOrderService;
import com.optimalroute.app.objects.Client;

@Controller
public class CRUDClientController {
	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		ArrayList<Client> clientsList = (ArrayList<Client>) orderService.findAllClients();

		model.addAttribute("clientsList", clientsList);

		return "clients";
	}

	@RequestMapping(value = "/addClient", method = RequestMethod.GET)
	public String addClientPage(Model model) {
		return "addClient";
	}

	@RequestMapping(value = "/addClient", method = RequestMethod.POST)
	public String addClient(@ModelAttribute("client") Client client) {
		orderService.insert(client);
		return "redirect:/addOrder";
	}
}
