package com.optimalroute.app.objects;

import org.springframework.stereotype.Component;

@Component("account")
public class Account {
	private int id;
	private String login;
	private String password;
	private Courier courier;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Courier getCourier() {
		return courier;
	}

	public void setCourier(Courier courier) {
		this.courier = courier;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", login=" + login + ", password=" + password + ", courier=" + courier + "]";
	}

}
