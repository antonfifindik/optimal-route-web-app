package com.optimalroute.app.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.optimalroute.app.configs.SpringConfig;
import com.optimalroute.app.dao.MySqlOrderDao;
import com.optimalroute.app.objects.Order;

@Component("orderMapper")
public class OrderMapper implements RowMapper<Order> {

	private static final String SELECT_FOR_ADDRESS;
	private static final String SELECT_FOR_CLIENT;
	private static final String SELECT_FOR_COURIER;
	private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
	private MySqlOrderDao mySqlOrderDao = (MySqlOrderDao) context.getBean("mySqlOrderDao");

	static {
		SELECT_FOR_ADDRESS = "select * from addresses where id = %d;";
		SELECT_FOR_CLIENT = "select * from clients where id = %d;";
		SELECT_FOR_COURIER = "select * from couriers where id = %d;";
	}

	@Override
	public Order mapRow(ResultSet arg0, int arg1) throws SQLException {
		int address_id = arg0.getInt(2);
		int sender_id = arg0.getInt(3);
		int recipient_id = arg0.getInt(4);
		int courier_id = arg0.getInt(5);

		Order result = new Order();
		result.setId(arg0.getInt(1));
		result.setAddress(mySqlOrderDao.getJdbcTemplate().queryForObject(String.format(SELECT_FOR_ADDRESS, address_id), new AddressMapper()));
		result.setSender(mySqlOrderDao.getJdbcTemplate().queryForObject(String.format(SELECT_FOR_CLIENT, sender_id), new ClientMapper()));
		result.setRecipient(mySqlOrderDao.getJdbcTemplate().queryForObject(String.format(SELECT_FOR_CLIENT, recipient_id), new ClientMapper()));
		result.setCourier(mySqlOrderDao.getJdbcTemplate().queryForObject(String.format(SELECT_FOR_COURIER, courier_id), new CourierMapper()));
		result.setDate(LocalDate.parse(arg0.getString(6)));
		result.setStatus(arg0.getInt(6) == 1 ? true : false);

		return result;
	}

}
