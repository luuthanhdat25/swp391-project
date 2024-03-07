package com.swpproject.application.repository;

import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.Orders;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Orders, Integer> {
    Optional<Orders> findOrdersById(Integer id);
}
