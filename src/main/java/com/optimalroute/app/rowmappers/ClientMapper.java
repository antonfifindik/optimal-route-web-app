package com.optimalroute.app.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.optimalroute.app.objects.Client;

@Component("clientMapper")
public class ClientMapper implements RowMapper<Client> {

	@Override
	public Client mapRow(ResultSet arg0, int arg1) throws SQLException {
		Client result = new Client();
		result.setId(arg0.getInt(1));
		result.setSurname(arg0.getString(2));
		result.setName(arg0.getString(3));
		result.setPatronymic(arg0.getString(4));
		result.setPhoneNumber(arg0.getString(5));

		return result;
	}

}
