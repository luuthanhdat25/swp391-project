package com.swpproject.application.service;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public interface GymerService {

    void save(Gymer gymer);

    Optional<Gymer> getGymerByAccount(Account account);

}
