package com.optimalroute.app.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("account", HomeController.account);

		return "map";
	}

	@RequestMapping(value = "/getNewAddressFirst", method = RequestMethod.GET)
	public @ResponseBody String getFirstAddress() {
		return "VInnitsya, YunostI, 45";
	}

	@RequestMapping(value = "/getNewAddressSecond", method = RequestMethod.GET)
	public @ResponseBody String getSecondAddress() {
		return "Vinnitsa, Soborna, 43";
	}

	@RequestMapping(value = "/getNewAddressThird", method = RequestMethod.GET)
	public @ResponseBody String getThirdSecond() {
		return "Vinnitsa, Lesi Ukrainky, 20";
	}

	@RequestMapping(value = "/getAddresses", method = RequestMethod.GET)
	public @ResponseBody String[] addAddressToMap() {

		return new String[] { "Vinnitsa, 600-letiya, 58", "Vinnitsa, 600-letiya, 21" };
	}

	@RequestMapping(value = "/getArrayAddresses", method = RequestMethod.GET)
	public @ResponseBody String[] getArrayAddresses() {

		return new String[] { "Vinnitsa, Lesi Ukrainky, 20", "Vinnitsa, Soborna, 20", "Vinnitsa, Lesi Ukrainky, 10" };
	}

}
