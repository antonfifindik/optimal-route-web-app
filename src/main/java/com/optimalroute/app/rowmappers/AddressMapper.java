package com.optimalroute.app.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.optimalroute.app.objects.Address;

@Component("addressMapper")
public class AddressMapper implements RowMapper<Address> {

	@Override
	public Address mapRow(ResultSet arg0, int arg1) throws SQLException {
		Address result = new Address();
		result.setId(arg0.getInt(1));
		result.setCity(arg0.getString(2));
		result.setStreet(arg0.getString(3));
		result.setHouseNumber(arg0.getString(4));
		result.setApartmentNumber(arg0.getString(5));

		return result;
	}

}
