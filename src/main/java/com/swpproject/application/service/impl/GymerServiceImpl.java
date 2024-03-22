package com.swpproject.application.service.impl;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.repository.GymerRepository;
import com.swpproject.application.service.GymerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GymerServiceImpl implements GymerService {

    @Autowired
    private GymerRepository gymerRepository;

    @Override
    public void save(Gymer gymer) {
        gymerRepository.save(gymer);
    }

    @Override
    public Optional<Gymer> getGymerByAccount(Account account) {
        return gymerRepository.getGymerByAccount(account);
    }

    @Override
    public List<Gymer> getAll() {
        return gymerRepository.findAll();
    }

    @Override
    public Optional<Gymer> getGymerById(Integer id) {
        return gymerRepository.findById(id);
    }
}
