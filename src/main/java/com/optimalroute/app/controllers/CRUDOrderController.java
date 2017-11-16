package com.optimalroute.app.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IAddressService;
import com.optimalroute.app.interfaces.IClientService;
import com.optimalroute.app.interfaces.ICourierService;
import com.optimalroute.app.interfaces.IOrderService;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;

@Controller
public class CRUDOrderController {

	@Autowired
	private IOrderService orderService;
	@Autowired
	private IAddressService addressService;
	@Autowired
	private IClientService clientService;
	@Autowired
	private ICourierService courierService;

	private static int idDelete;

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrderPage(Model model) {
		List<Courier> couriersList = courierService.findAllCouriers();
		List<Address> addressesList = addressService.findAllAddresses();
		List<Client> clientsList = clientService.findAllClients();
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

		orderService.insert(sql);

		return "redirect:/";
	}

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
	public String deleteOrder(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		idDelete = id;
		model.addAttribute("orderForDelete", orderService.selectOrderById(id));
		return "confirmationOfDeletion";
	}

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(HttpServletRequest request) {
		orderService.delete(idDelete);
		return "redirect:/";
	}
}
