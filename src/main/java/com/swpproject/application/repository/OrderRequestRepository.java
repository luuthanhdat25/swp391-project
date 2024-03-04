package com.swpproject.application.repository;

import com.swpproject.application.model.OrderRequest;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRequestRepository extends JpaRepository<OrderRequest,Integer> {

}
