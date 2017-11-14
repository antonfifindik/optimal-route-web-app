package com.optimalroute.app.objects;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component("order")
public class Order {
	private int id;
	private Address senderAddress;
	private Address recipientAddress;
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

	public Address getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(Address senderAddress) {
		this.senderAddress = senderAddress;
	}

	public Address getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(Address recipientAddress) {
		this.recipientAddress = recipientAddress;
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
		return "Order [id=" + id + ", senderAddress=" + senderAddress + ", recipientAddress=" + recipientAddress + ", sender=" + sender + ", recipient=" + recipient + ", courier=" + courier + ", date=" + date + ", status=" + status + "]";
	}

}
