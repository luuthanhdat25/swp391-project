package com.swpproject.application.repository;

import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRequestRepository extends JpaRepository<OrderRequest,Integer> {
    List<OrderRequest> getOrderRequestByPersonalTrainer(PersonalTrainer personalTrainer);

//    @Modifying
//    @Query("UPDATE OrderRequest o SET o.status = :newStatus WHERE o.orderId = :orderId")
//    void updateOrderStatus( Integer orderId, OrderStatus newStatus);

    boolean existsByGymer_GymerIdAndAndStatus(Integer gymerID, OrderStatus orderStatus);
    List<OrderRequest> findAllByPersonalTrainerAndStatus(PersonalTrainer personalTrainer,OrderStatus orderStatus);

    public OrderRequest findByGymer(Gymer gymer);
    List<OrderRequest> getOrderRequestByGymer(Gymer gymer);
}
