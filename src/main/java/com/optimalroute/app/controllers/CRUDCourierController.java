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
import com.optimalroute.app.objects.Courier;

@Controller
public class CRUDCourierController {
	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/couriers", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		ArrayList<Courier> couriersList = (ArrayList<Courier>) orderService.findAllCouriers();

		model.addAttribute("couriersList", couriersList);

		return "couriers";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.GET)
	public String addCourierPage(Model model) {
		return "addCourier";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.POST)
	public String addCourier(@ModelAttribute("courier") Courier courier) {
		orderService.insert(courier);
		return "redirect:/addOrder";
	}
}
