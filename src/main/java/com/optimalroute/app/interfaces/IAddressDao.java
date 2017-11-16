package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Address;

public interface IAddressDao {

	void insert(Address address);

	Address selectAddressById(int id);

	void delete(Address address);

	void delete(int id);

	List<Address> findAllAddresses();
}
