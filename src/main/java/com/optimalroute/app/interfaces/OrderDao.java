package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Order;

public interface OrderDao {
	void insert(Order order);

	void insert(List<Order> list);

	void delete(Order order);

	void delete(int id);

	List<Order> findAll();
}
