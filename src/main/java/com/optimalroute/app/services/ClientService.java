package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.IClientDao;
import com.optimalroute.app.interfaces.IClientService;
import com.optimalroute.app.objects.Client;

@Component("clientService")
public class ClientService implements IClientService {

	@Autowired
	private IClientDao clientDao;

	@Override
	@Transactional
	public void insert(Client client) {
		clientDao.insert(client);

	}

	@Override
	@Transactional(readOnly = true)
	public Client selectClientById(int id) {
		return clientDao.selectClientById(id);
	}

	@Override
	@Transactional
	public void delete(Client client) {
		clientDao.delete(client);
	}

	@Override
	@Transactional
	public void delete(int id) {
		clientDao.delete(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Client> findAllClients() {
		return clientDao.findAllClients();
	}

}
