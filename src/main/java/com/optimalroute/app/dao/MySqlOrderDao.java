package com.optimalroute.app.dao;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.configs.SpringConfig;
import com.optimalroute.app.interfaces.OrderDao;
import com.optimalroute.app.objects.Address;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.objects.Order;
import com.optimalroute.app.rowmappers.AddressMapper;
import com.optimalroute.app.rowmappers.ClientMapper;
import com.optimalroute.app.rowmappers.CourierMapper;
import com.optimalroute.app.rowmappers.OrderMapper;

@Component("mySqlOrderDao")
public class MySqlOrderDao implements OrderDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(Order order) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(List<Order> list) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Order order) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Order> findAll() {
		String sql = "select * from orders";
		return jdbcTemplate.query(sql, new OrderMapper());
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public static void main(String[] args) { // test
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
		MySqlOrderDao mySqlOrderDao = (MySqlOrderDao) context.getBean("mySqlOrderDao");
		String surname = mySqlOrderDao.jdbcTemplate.queryForObject("select order_date from orders where id = 2;", String.class);
		System.err.println(surname);
		LocalDate date = LocalDate.parse(surname);
		System.err.println(date);
		System.err.println(date.getYear());
		System.err.println(date.getMonthValue());
		System.err.println(date.getDayOfMonth());

		Address address = mySqlOrderDao.jdbcTemplate.queryForObject("select * from addresses where id = 2;", new AddressMapper());
		System.out.println(address);
		Client client = mySqlOrderDao.jdbcTemplate.queryForObject("select * from clients where id = 2;", new ClientMapper());
		System.out.println(client);
		Courier courier = mySqlOrderDao.jdbcTemplate.queryForObject("select * from couriers where id = 2;", new CourierMapper());
		System.out.println(courier);
		Order order = mySqlOrderDao.jdbcTemplate.queryForObject("select * from orders where id = 2;", new OrderMapper());
		System.err.println(order);

	}

}
