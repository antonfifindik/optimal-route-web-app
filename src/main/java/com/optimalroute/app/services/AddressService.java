package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.IAddressDao;
import com.optimalroute.app.interfaces.IAddressService;
import com.optimalroute.app.objects.Address;

@Component("addressService")
public class AddressService implements IAddressService {

	@Autowired
	private IAddressDao addressDao;

	@Override
	@Transactional
	public void insert(Address address) {
		addressDao.insert(address);
	}

	@Override
	@Transactional(readOnly = true)
	public Address selectAddressById(int id) {
		return addressDao.selectAddressById(id);
	}

	@Override
	@Transactional
	public void delete(Address address) {
		addressDao.delete(address);
	}

	@Override
	@Transactional
	public void delete(int id) {
		addressDao.delete(id);
	}

	@Override
	public void update(Address address) {
		addressDao.update(address);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Address> findAllAddresses() {
		return addressDao.findAllAddresses();
	}

}
