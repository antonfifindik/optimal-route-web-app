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
		String sql = String.format("update orders set sender_address_id = %d, recipient_address_id = %d, client_sender_id = %d, client_recipient_id = %d, courier_id = %d, status = %d where id = %d", order.getSenderAddress().getId(),
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
}
