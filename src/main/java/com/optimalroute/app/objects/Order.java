package com.optimalroute.app.objects;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component("order")
public class Order {
	private int id;
	private Address address;
	private Client sender;
	private Client recipient;
	private Courier courier;
	private LocalDate date;
	private boolean status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Client getSender() {
		return sender;
	}

	public void setSender(Client sender) {
		this.sender = sender;
	}

	public Client getRecipient() {
		return recipient;
	}

	public void setRecipient(Client recipient) {
		this.recipient = recipient;
	}

	public Courier getCourier() {
		return courier;
	}

	public void setCourier(Courier courier) {
		this.courier = courier;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", address=" + address + ", sender=" + sender + ", recipient=" + recipient + ", courier=" + courier + ", date=" + date + ", status=" + status + "]";
	}

}
