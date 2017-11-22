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
		jdbcTemplate.update(String.format("insert into clients (surname, name, patronymic, phone_number) values ('%s','%s','%s','+380%s');", client.getSurname(), client.getName(), client.getPatronymic(), client.getPhoneNumber()));
	}

	@Override
	public Client selectClientById(int id) {
		String sql = String.format("select * from clients where id = %d;", id);
		return jdbcTemplate.query(sql, new ClientMapper()).get(0);
	}

	@Override
	public void delete(Client client) {
		jdbcTemplate.update(String.format("delete from clients where id = %s", client.getId()));
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(String.format("delete from clients where id = %s", id));
	}

	@Override
	public void update(Client client) {
		String sql = String.format("update clients set surname='%s', name='%s', patronymic='%s', phone_number='+380%s'  where id = %d", client.getSurname(), client.getName(), client.getPatronymic(), client.getPhoneNumber(), client.getId());
		jdbcTemplate.update(sql);
	}

	@Override
	public List<Client> findAllClients() {
		return jdbcTemplate.query("select * from clients", new ClientMapper());
	}

}
