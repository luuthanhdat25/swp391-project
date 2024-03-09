package com.swpproject.application.repository;

import com.swpproject.application.model.*;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Orders, Integer> {
    List<Orders> findAllByGymer(Gymer gymer);
}
