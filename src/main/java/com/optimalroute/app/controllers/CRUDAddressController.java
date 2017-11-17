package com.optimalroute.app.controllers;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IAddressService;
import com.optimalroute.app.objects.Address;

@Controller
public class CRUDAddressController {

	@Autowired
	private IAddressService addressService;
	private static int idDelete;
	private static int idUpdate;

	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		ArrayList<Address> addressesList = (ArrayList<Address>) addressService.findAllAddresses();

		model.addAttribute("addressesList", addressesList);

		return "addresses";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String addAddressPage(Model model) {
		return "addAddress";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("address") Address address) {
		addressService.insert(address);
		return "redirect:/addOrder";
	}

	@RequestMapping(value = "/deleteAddress", method = RequestMethod.GET)
	public String deleteAddress(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		idDelete = id;
		model.addAttribute("addressForDelete", addressService.selectAddressById(id));
		return "confirmationOfDeletionAddress";
	}

	@RequestMapping(value = "/deleteAddress", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {

		try {
			addressService.delete(idDelete);
		} catch (Exception e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "errorDelete";
		}

		return "redirect:/addresses";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.GET)
	public String updateAddress(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		idUpdate = id;
		model.addAttribute("updateAddress", addressService.selectAddressById(id));
		return "updateAddress";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute("address") Address address) {
		address.setId(idUpdate);
		addressService.update(address);
		return "redirect:/addresses";
	}

}
