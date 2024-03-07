package com.swpproject.application.service.impl;

import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.OrderRequestRepository;
import com.swpproject.application.service.OrderRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderRequestImpl implements OrderRequestService {


    @Override
    public OrderRequest getOrderRequestById(Integer orderId) {
        return orderRequestRepository.findById(orderId).orElse(null);
    }

    @Autowired
    private OrderRequestRepository orderRequestRepository;

    @Override
    public void saveOrderRequest(OrderRequest orderRequest) {
        orderRequestRepository.save(orderRequest);

    }
    @Override
    public List<OrderRequest> getOrderRequest() {
        return orderRequestRepository.findAll();
    }
    @Override
    public List<OrderRequest> getOrderRequestList(PersonalTrainer personalTrainer) {
        return orderRequestRepository.getOrderRequestByPersonalTrainer(personalTrainer);
    }
    @Override
    public void updateStatusOrder(OrderStatus orderStatus, Integer orderId) {
        orderRequestRepository.updateOrderStatus(orderStatus,orderId);
    }
}
