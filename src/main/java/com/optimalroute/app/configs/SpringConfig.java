package com.optimalroute.app.configs;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.optimalroute.app.dao.MySqlAccountDao;
import com.optimalroute.app.dao.MySqlCourierDao;
import com.optimalroute.app.dao.MySqlOrderDao;

@Configuration
public class SpringConfig {

	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl("jdbc:mysql://localhost:3306/db_delivery?characterEncoding=UTF-8");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		return dataSource;
	}

	@Bean
	public JdbcTemplate getJdbcTemplate() {
		return new JdbcTemplate(getDataSource());
	}

	@Bean
	public MySqlOrderDao mySqlOrderDao() {
		return new MySqlOrderDao();
	}

	@Bean
	public MySqlAccountDao mySqlAccountDao() {
		return new MySqlAccountDao();
	}

	@Bean
	public MySqlCourierDao mySqlCourierDao() {
		return new MySqlCourierDao();
	}
}
