package com.optimalroute.app.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

@Controller
public class CRUDController {
	private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
	private static MySqlOrderDao mySqlOrderDao = (MySqlOrderDao) context.getBean("mySqlOrderDao");
	private static int idDelete;

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

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
	public String deleteOrder(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		idDelete = id;
		model.addAttribute("orderForDelete", mySqlOrderDao.selectOrderById(id));
		return "confirmationOfDeletion";
	}

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(HttpServletRequest request) {
		mySqlOrderDao.delete(idDelete);
		return "redirect:/";
	}
}
