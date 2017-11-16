package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.ICourierDao;
import com.optimalroute.app.interfaces.ICourierService;
import com.optimalroute.app.objects.Courier;

@Component("courierService")
public class CourierService implements ICourierService {
	@Autowired
	private ICourierDao courierDao;

	@Override
	@Transactional
	public void insert(Courier courier) {
		courierDao.insert(courier);
	}

	@Override
	@Transactional(readOnly = true)
	public Courier selectCourierById(int id) {
		return courierDao.selectCourierById(id);
	}

	@Override
	@Transactional
	public void delete(Courier courier) {
		courierDao.delete(courier);
	}

	@Override
	@Transactional
	public void delete(int id) {
		courierDao.delete(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Courier> findAllCouriers() {
		return courierDao.findAllCouriers();
	}

}
