package com.optimalroute.app.interfaces;

import java.util.List;

import com.optimalroute.app.objects.Account;

public interface IAccountDao {
	List<Account> findAllAccount();
}
