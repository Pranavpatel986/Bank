package com.hendisantika.onlinebanking.repository;

import com.hendisantika.onlinebanking.entity.Appointment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface AppointmentDao extends CrudRepository<Appointment, Long> {

    List<Appointment> findAll();
}