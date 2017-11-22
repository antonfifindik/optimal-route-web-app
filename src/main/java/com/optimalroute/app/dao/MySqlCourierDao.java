package com.optimalroute.app.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.optimalroute.app.interfaces.ICourierDao;
import com.optimalroute.app.objects.Courier;
import com.optimalroute.app.rowmappers.CourierMapper;

@Component("mySqlCourierDao")
public class MySqlCourierDao implements ICourierDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(Courier courier) {
		jdbcTemplate.update(String.format("insert into couriers (surname, name, patronymic, phone_number) values ('%s','%s','%s','+380%s');", courier.getSurname(), courier.getName(), courier.getPatronymic(), courier.getPhoneNumber()));
	}

	@Override
	public Courier selectCourierById(int id) {
		String sql = String.format("select * from couriers where id = %d;", id);
		return jdbcTemplate.query(sql, new CourierMapper()).get(0);
	}

	@Override
	public void delete(Courier courier) {
		jdbcTemplate.update(String.format("delete from couriers where id = %s", courier.getId()));
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(String.format("delete from couriers where id = %s", id));
	}

	@Override
	public void update(Courier courier) {
		String sql = String.format("update couriers set surname='%s', name='%s', patronymic='%s', phone_number='+380%s'  where id = %d", courier.getSurname(), courier.getName(), courier.getPatronymic(), courier.getPhoneNumber(), courier.getId());
		jdbcTemplate.update(sql);
	}

	@Override
	public List<Courier> findAllCouriers() {
		return jdbcTemplate.query("select * from couriers", new CourierMapper());
	}

}
