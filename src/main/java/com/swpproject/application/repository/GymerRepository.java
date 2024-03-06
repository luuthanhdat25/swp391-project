package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GymerRepository extends JpaRepository<Gymer, Integer> {

    Optional<Gymer> getGymerByAccount(Account account);

}
