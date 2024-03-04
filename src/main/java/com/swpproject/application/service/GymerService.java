package com.swpproject.application.service;

import com.swpproject.application.model.Gymer;
import org.springframework.stereotype.Service;


@Service
public interface GymerService {
    public Gymer GetGymerProifile(Integer AccountId);
    public void SaveGymer(Gymer gymer);
}
