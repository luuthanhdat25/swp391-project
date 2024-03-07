package com.swpproject.application.service;


import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderRequestService {
    public void saveOrUpdateOrderRequest(OrderRequest orderRequest);
    public List<OrderRequest> getOrderRequest();
    public OrderRequest getOrderRequestById(Integer orderID);
    public List<OrderRequest> getOrderRequestList(PersonalTrainer personalTrainer);
    public void deleteOrder(Integer orderId);
}
