package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.objects.Order;

public interface IOrderService {
	void insert(Order order);

	void insert(List<Order> list);

	void insert(String sql);

	void insert(Address address);

	void insert(Client client);

	void insert(Courier courier);

	Order selectOrderById(int id);

	void delete(Order order);

	void delete(int id);

	List<Order> findAllOrders();

	List<Courier> findAllCouriers();

	List<Address> findAllAddresses();

	List<Client> findAllClients();
}
