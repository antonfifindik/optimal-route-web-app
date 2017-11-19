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
	private static Courier deleteCourier;
	private static Courier updateCourier;

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
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		deleteCourier = courierService.selectCourierById(id);
		model.addAttribute("courierForDelete", deleteCourier);
		return "confirmationOfDeletionCourier";
	}

	@RequestMapping(value = "/deleteCourier", method = RequestMethod.POST)
	public String deleteCourier(HttpServletRequest request, Model model) {

		try {
			courierService.delete(deleteCourier);
		} catch (Exception e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "errorDelete";
		}

		return "redirect:/couriers";
	}

	@RequestMapping(value = "/updateCourier", method = RequestMethod.GET)
	public String updateCourier(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		updateCourier = courierService.selectCourierById(id);

		model.addAttribute("updateCourier", updateCourier);
		return "updateCourier";
	}

	@RequestMapping(value = "/updateCourier", method = RequestMethod.POST)
	public String updateCourier(@ModelAttribute("courier") Courier courier) {
		if (!updateCourier.equals(courier)) {
			courier.setId(updateCourier.getId());
			courierService.update(courier);
		}
		return "redirect:/couriers";
	}
}
