package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.IOrderDao;
import com.optimalroute.app.objects.Order;
import com.optimalroute.app.rowmappers.OrderMapper;

@Component("mySqlOrderDao")
public class MySqlOrderDao implements IOrderDao {
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
	public void insert(String sql) {
		jdbcTemplate.update(sql);
	}

	@Override
	public Order selectOrderById(int id) {
		String sql = String.format("select * from orders where id = %d;", id);
		return jdbcTemplate.query(sql, new OrderMapper()).get(0);
	}

	@Override
	public void delete(Order order) {
		jdbcTemplate.update(String.format("delete from orders where id = %s", order.getId()));
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(String.format("delete from orders where id = %s", id));

	}

	@Override
	public void update(Order order) {
		String sql = String.format("update from orders set sender_address_id = %d, recipient_address_id = %d, client_sender_id = %d, client_recipient_id = %d, courier_id = %d, status = %d where id = %d", order.getSenderAddress().getId(),
				order.getRecipientAddress().getId(), order.getSender().getId(), order.getRecipient().getId(), order.getCourier().getId(), order.isStatus() == true ? 1 : 0, order.getId());
		jdbcTemplate.update(sql);
	}

	@Override
	public List<Order> findAllOrders() {
		return jdbcTemplate.query("select * from orders", new OrderMapper());
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	//
	// public static void main(String[] args) { // test
	// AnnotationConfigApplicationContext context = new
	// AnnotationConfigApplicationContext(SpringConfig.class);
	// MySqlOrderDao mySqlOrderDao = (MySqlOrderDao)
	// context.getBean("mySqlOrderDao");
	// String surname = mySqlOrderDao.jdbcTemplate.queryForObject("select order_date
	// from orders where id = 2;", String.class);
	// System.err.println(surname);
	// LocalDate date = LocalDate.parse(surname);
	// System.err.println(date);
	// System.err.println(date.getYear());
	// System.err.println(date.getMonthValue());
	// System.err.println(date.getDayOfMonth());
	//
	// Address address = mySqlOrderDao.jdbcTemplate.queryForObject("select * from
	// addresses where id = 2;", new AddressMapper());
	// System.out.println(address);
	// Client client = mySqlOrderDao.jdbcTemplate.queryForObject("select * from
	// clients where id = 2;", new ClientMapper());
	// System.out.println(client);
	// Courier courier = mySqlOrderDao.jdbcTemplate.queryForObject("select * from
	// couriers where id = 2;", new CourierMapper());
	// System.out.println(courier);
	// Order order = mySqlOrderDao.jdbcTemplate.queryForObject("select * from orders
	// where id = 2;", new OrderMapper());
	// System.err.println(order);
	// mySqlOrderDao.findAllCouriers().stream().forEach(System.out::println);
	//
	// System.out.println(LocalDate.now());
	// }

}
