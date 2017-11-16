package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.IClientDao;
import com.optimalroute.app.objects.Client;
import com.optimalroute.app.rowmappers.ClientMapper;

@Component("mySqlClientDao")
public class MySqlClientDao implements IClientDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(Client client) {
		jdbcTemplate.update(String.format("insert into clients (surname, name, patronymic, phone_number) values ('%s','%s','%s','%s');", client.getSurname(), client.getName(), client.getPatronymic(), client.getPhoneNumber()));
	}

	@Override
	public Client selectClientById(int id) {
		String sql = String.format("select * from clients where id = %d;", id);
		return jdbcTemplate.query(sql, new ClientMapper()).get(0);
	}

	@Override
	public void delete(Client client) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(String.format("delete from clients where id = %s", id));
	}

	@Override
	public List<Client> findAllClients() {
		return jdbcTemplate.query("select * from clients", new ClientMapper());
	}

}
