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
import com.optimalroute.app.objects.Address;

@Controller
public class CRUDAddressController {

	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		ArrayList<Address> addressesList = (ArrayList<Address>) orderService.findAllAddresses();

		model.addAttribute("addressesList", addressesList);

		return "addresses";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String addAddressPage(Model model) {
		return "addAddress";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("address") Address address) {
		orderService.insert(address);
		return "redirect:/addOrder";
	}
}
