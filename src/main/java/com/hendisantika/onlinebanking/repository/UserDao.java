package com.hendisantika.onlinebanking.repository;

import com.hendisantika.onlinebanking.entity.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface UserDao extends CrudRepository<User, Long> {

    User findByUsername(String username);

    User findByEmail(String email);

    List<User> findAll();
}