package com.swpproject.application.service;


import com.swpproject.application.model.OrderRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderRequestService {
    public void saveOrderRequest(OrderRequest orderRequest);
    public List<OrderRequest> getOrderRequest();
    public OrderRequest getOrderRequestById(Integer orderID);
}
