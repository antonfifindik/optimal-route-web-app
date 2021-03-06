package com.optimalroute.app.controllers;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IOrderService;
import com.optimalroute.app.objects.Account;
import com.optimalroute.app.objects.Order;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static int idDelete;
	private static Account currentAccount;

	@Autowired
	private IOrderService orderService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		ArrayList<Order> ordersList = (ArrayList<Order>) orderService.findAllOrders();

		model.addAttribute("ordersList", ordersList);
		model.addAttribute("account", currentAccount);

		return "home";
	}

	public static Account getCurrentAccount() {
		return currentAccount;
	}

	public static void setCurrentAccount(Account currentAccount) {
		HomeController.currentAccount = currentAccount;
	}

}
