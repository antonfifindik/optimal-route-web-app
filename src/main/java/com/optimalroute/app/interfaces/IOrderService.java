package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Order;

public interface IOrderService {
	void insert(Order order);

	void insert(List<Order> list);

	void insert(String sql);

	Order selectOrderById(int id);

	void delete(Order order);

	void delete(int id);

	void update(Order order);

	List<Order> findAllOrders();

}
