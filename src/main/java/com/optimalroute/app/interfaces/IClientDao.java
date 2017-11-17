package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Client;

public interface IClientDao {

	void insert(Client client);

	Client selectClientById(int id);

	void delete(Client client);

	void delete(int id);

	void update(Client client);

	List<Client> findAllClients();
}
