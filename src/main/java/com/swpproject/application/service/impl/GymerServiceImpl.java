package com.swpproject.application.service.impl;

import com.swpproject.application.model.Gymer;
import com.swpproject.application.repository.GymerRepository;
import com.swpproject.application.service.GymerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class GymerServiceImpl implements GymerService {


    @Autowired
    private GymerRepository gymerRepository;
    @Override
    public Gymer GetGymerProifile(Integer AccountId) {
        return gymerRepository.findGymerByAccount_AccountId(AccountId);
    }
    @Override
    public void SaveGymer(Gymer gymer) {
        gymerRepository.save(gymer);
    }
}
