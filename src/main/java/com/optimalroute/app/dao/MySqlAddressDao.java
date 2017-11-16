package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.IAddressDao;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.rowmappers.AddressMapper;

@Component("mySqlAddressDao")
public class MySqlAddressDao implements IAddressDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(Address address) {
		jdbcTemplate.update(String.format("insert into addresses (city, street, house_number, apartment_number) values ('%s','%s','%s','%s');", address.getCity(), address.getStreet(), address.getHouseNumber(), address.getApartmentNumber()));
	}

	@Override
	public Address selectAddressById(int id) {
		String sql = String.format("select * from addresses where id = %d;", id);
		return jdbcTemplate.query(sql, new AddressMapper()).get(0);
	}

	@Override
	public void delete(Address address) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(String.format("delete from addresses where id = %s", id));
	}

	@Override
	public List<Address> findAllAddresses() {
		return jdbcTemplate.query("select * from addresses", new AddressMapper());
	}

}
