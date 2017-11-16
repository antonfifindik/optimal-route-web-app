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

import com.optimalroute.app.interfaces.ICourierService;
import com.optimalroute.app.objects.Courier;

@Controller
public class CRUDCourierController {
	private static int idDelete;

	@Autowired
	private ICourierService courierService;

	@RequestMapping(value = "/couriers", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		ArrayList<Courier> couriersList = (ArrayList<Courier>) courierService.findAllCouriers();

		model.addAttribute("couriersList", couriersList);

		return "couriers";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.GET)
	public String addCourierPage(Model model) {
		return "addCourier";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.POST)
	public String addCourier(@ModelAttribute("courier") Courier courier) {
		courierService.insert(courier);
		return "redirect:/couriers";
	}

	@RequestMapping(value = "/deleteCourier", method = RequestMethod.GET)
	public String deleteCourier(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		idDelete = id;
		model.addAttribute("courierForDelete", courierService.selectCourierById(id));
		return "confirmationOfDeletionCourier";
	}

	@RequestMapping(value = "/deleteCourier", method = RequestMethod.POST)
	public String deleteCourier(HttpServletRequest request) {

		try {
			courierService.delete(idDelete);
		} catch (Exception e) {
			System.err.println("Неможливо видалити запис, так як є пов'язані записи!");
			System.out.println(e.getMessage());
		}

		return "redirect:/couriers";
	}
}
