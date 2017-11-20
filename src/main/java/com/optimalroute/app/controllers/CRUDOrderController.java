package com.optimalroute.app.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IAddressService;
import com.optimalroute.app.interfaces.IClientService;
import com.optimalroute.app.interfaces.ICourierService;
import com.optimalroute.app.interfaces.IOrderService;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.objects.Order;

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

	private static Order deleteOrder;
	private static Order updateOrder;

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrderPage(Model model) {
		List<Courier> couriersList = courierService.findAllCouriers();
		List<Address> addressesList = addressService.findAllAddresses();
		List<Client> clientsList = clientService.findAllClients();
		Collections.sort(couriersList, ((c1, c2) -> c1.getSurname().compareTo(c2.getSurname())));
		Collections.sort(addressesList, ((a1, a2) -> a1.getStreet().compareTo(a2.getStreet())));
		Collections.sort(clientsList, ((c1, c2) -> c1.getSurname().compareTo(c2.getSurname())));

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
		deleteOrder = orderService.selectOrderById(id);
		model.addAttribute("orderForDelete", deleteOrder);
		return "confirmationOfDeletion";
	}

	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(HttpServletRequest request) {
		orderService.delete(deleteOrder);
		return "redirect:/";
	}

	@RequestMapping(value = "/updateOrder", method = RequestMethod.GET)
	public String updateOrder(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		updateOrder = orderService.selectOrderById(id);

		List<Courier> couriersList = courierService.findAllCouriers();
		List<Address> addressesList = addressService.findAllAddresses();
		List<Client> clientsList = clientService.findAllClients();
		Collections.sort(couriersList, ((c1, c2) -> c1.getSurname().compareTo(c2.getSurname())));
		Collections.sort(addressesList, ((a1, a2) -> a1.getStreet().compareTo(a2.getStreet())));
		Collections.sort(clientsList, ((c1, c2) -> c1.getSurname().compareTo(c2.getSurname())));

		model.addAttribute("couriersList", couriersList);
		model.addAttribute("addressesList", addressesList);
		model.addAttribute("clientsList", clientsList);

		model.addAttribute("updateOrder", updateOrder);
		return "updateOrder";
	}

	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	public String updateOrder(@ModelAttribute("order") Order order) {
		if (!updateOrder.equals(order)) {
			order.setId(updateOrder.getId());
			// orderService.update(order);
			System.out.println(order);
		}
		return "redirect:/";
	}
}