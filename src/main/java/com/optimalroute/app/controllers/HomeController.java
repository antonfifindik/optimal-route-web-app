package com.optimalroute.app.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.configs.SpringConfig;
import com.optimalroute.app.dao.MySqlOrderDao;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.objects.Order;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
	private static MySqlOrderDao mySqlOrderDao = (MySqlOrderDao) context.getBean("mySqlOrderDao");

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		ArrayList<Order> ordersList = (ArrayList<Order>) mySqlOrderDao.findAllOrders();

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("ordersList", ordersList);

		return "home";
	}

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrderPage(Model model) {
		List<Courier> couriersList = mySqlOrderDao.findAllCouriers();
		List<Address> addressesList = mySqlOrderDao.findAllAddresses();
		List<Client> clientsList = mySqlOrderDao.findAllClients();
		Collections.sort(couriersList, ((c1, c2) -> c2.getId() - c1.getId()));
		Collections.sort(addressesList, ((a1, a2) -> a2.getId() - a1.getId()));
		Collections.sort(clientsList, ((c1, c2) -> c2.getId() - c1.getId()));

		model.addAttribute("couriersList", couriersList);
		model.addAttribute("addressesList", addressesList);
		model.addAttribute("clientsList", clientsList);
		return "addOrder";
	}

	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	public String addOrder(HttpServletRequest request) {
		String sql = String.format("insert into orders " + "(sender_address_id, recipient_address_id, client_sender_id, client_recipient_id, courier_id, order_date, status) " + "values ('%s', '%s', '%s', '%s', '%s', now(), '0');",
				request.getParameter("senderAddress"), request.getParameter("recipientAddress"), request.getParameter("sender"), request.getParameter("recipient"), request.getParameter("courier"));

		mySqlOrderDao.insert(sql);

		return "redirect:/";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String addAddressPage(Model model) {
		return "addAddress";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("address") Address address) {
		mySqlOrderDao.insert(address);
		return "redirect:/addOrder";
	}

	@RequestMapping(value = "/addClient", method = RequestMethod.GET)
	public String addClientPage(Model model) {
		return "addClient";
	}

	@RequestMapping(value = "/addClient", method = RequestMethod.POST)
	public String addClient(@ModelAttribute("client") Client client) {
		mySqlOrderDao.insert(client);
		return "redirect:/addOrder";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.GET)
	public String addCourierPage(Model model) {
		return "addCourier";
	}

	@RequestMapping(value = "/addCourier", method = RequestMethod.POST)
	public String addCourier(@ModelAttribute("courier") Courier courier) {
		mySqlOrderDao.insert(courier);
		return "redirect:/addOrder";
	}

}
