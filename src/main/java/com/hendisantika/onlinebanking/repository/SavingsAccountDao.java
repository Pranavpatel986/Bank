package com.hendisantika.onlinebanking.repository;

import com.hendisantika.onlinebanking.entity.SavingsAccount;
import org.springframework.data.repository.CrudRepository;


public interface SavingsAccountDao extends CrudRepository<SavingsAccount, Long> {

    SavingsAccount findByAccountNumber(int accountNumber);
}