package com.optimalroute.app.objects;

import org.springframework.stereotype.Component;

@Component("orderForCourier")
public class OrderForCourier {

	private int idOrder;
	private Address address;
	OrderType orderType;

	public int getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

}
