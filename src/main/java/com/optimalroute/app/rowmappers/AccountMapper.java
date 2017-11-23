package com.optimalroute.app.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.optimalroute.app.configs.SpringConfig;
import com.optimalroute.app.dao.MySqlCourierDao;
import com.optimalroute.app.objects.Account;

@Component("accountMapper")
public class AccountMapper implements RowMapper<Account> {
	private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
	private MySqlCourierDao mySqlCourierDao = (MySqlCourierDao) context.getBean("mySqlCourierDao");

	@Override
	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {

		Account result = new Account();
		result.setId(rs.getInt(1));
		result.setLogin(rs.getString(2));
		result.setPassword(rs.getString(3));
		result.setCourier(mySqlCourierDao.selectCourierById(rs.getInt(4)));

		return result;
	}

}
