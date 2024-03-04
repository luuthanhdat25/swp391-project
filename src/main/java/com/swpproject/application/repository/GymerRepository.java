package com.swpproject.application.repository;

import com.swpproject.application.model.Gymer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GymerRepository extends JpaRepository<Gymer,Integer> {
    public Gymer findGymerByAccount_AccountId(Integer PTID);
}
