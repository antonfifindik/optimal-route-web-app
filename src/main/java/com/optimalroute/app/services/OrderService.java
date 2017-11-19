package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.IOrderDao;
import com.optimalroute.app.interfaces.IOrderService;
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
	public void update(Order order) {
		orderDao.update(order);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Order> findAllOrders() {
		return orderDao.findAllOrders();
	}

}
