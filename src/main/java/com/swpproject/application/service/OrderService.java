package com.swpproject.application.service;

import com.swpproject.application.model.Orders;
import com.swpproject.application.model.Schedule;
import com.swpproject.application.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Orders> getSchedules() {
        return orderRepository.findAll();
    }

    public Optional<Orders> findOrdersById(Integer id) {
        return orderRepository.findOrdersById(id);
    }

    public void save(Orders orders) {
        orderRepository.save(orders);
    }
}
