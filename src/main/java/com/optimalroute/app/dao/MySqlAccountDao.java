package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.IAccountDao;
import com.optimalroute.app.objects.Account;
import com.optimalroute.app.rowmappers.AccountMapper;

@Component("mySqlAccountDao")
public class MySqlAccountDao implements IAccountDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Account> findAllAccount() {
		return jdbcTemplate.query("select * from accounts;", new AccountMapper());
	}

}
