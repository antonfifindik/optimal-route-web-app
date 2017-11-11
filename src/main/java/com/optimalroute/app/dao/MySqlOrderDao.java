package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.OrderDao;
import com.optimalroute.app.objects.Order;

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
		// TODO Auto-generated method stub
		return null;
	}

}
