package com.optimalroute.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.optimalroute.app.interfaces.IAccountDao;
import com.optimalroute.app.interfaces.IAccountService;
import com.optimalroute.app.objects.Account;

@Component("accountServices")
public class AccountServices implements IAccountService {

	@Autowired
	private IAccountDao accountDao;

	@Override
	@Transactional(readOnly = true)
	public List<Account> findAllAccount() {
		return accountDao.findAllAccount();
	}

}
