package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.IOrderDao;
import com.optimalroute.app.interfaces.IOrderService;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.objects.Order;

@Component("orderService")
public class OrderService implements IOrderService {

	@Autowired
	private IOrderDao orderDao;

	@Override
	@Transactional
	public void insert(Order order) {
		orderDao.insert(order);
	}

	@Override
	@Transactional
	public void insert(List<Order> list) {
		orderDao.insert(list);
	}

	@Override
	@Transactional
	public void insert(String sql) {
		orderDao.insert(sql);
	}

	@Override
	@Transactional
	public void insert(Address address) {
		orderDao.insert(address);
	}

	@Override
	@Transactional
	public void insert(Client client) {
		orderDao.insert(client);
	}

	@Override
	@Transactional
	public void insert(Courier courier) {
		orderDao.insert(courier);
	}

	@Override
	@Transactional(readOnly = true)
	public Order selectOrderById(int id) {
		return orderDao.selectOrderById(id);
	}

	@Override
	@Transactional
	public void delete(Order order) {
		orderDao.delete(order);
	}

	@Override
	@Transactional
	public void delete(int id) {
		orderDao.delete(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Order> findAllOrders() {
		return orderDao.findAllOrders();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Courier> findAllCouriers() {
		return orderDao.findAllCouriers();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Address> findAllAddresses() {
		return orderDao.findAllAddresses();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Client> findAllClients() {
		return orderDao.findAllClients();
	}

}
