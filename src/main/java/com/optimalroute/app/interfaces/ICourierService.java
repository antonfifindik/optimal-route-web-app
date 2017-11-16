package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Courier;

public interface ICourierService {

	void insert(Courier courier);

	Courier selectCourierById(int id);

	void delete(Courier courier);

	void delete(int id);

	List<Courier> findAllCouriers();

}
