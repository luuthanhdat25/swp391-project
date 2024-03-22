package com.swpproject.application.service;


import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderRequestService {
    public void saveOrUpdateOrderRequest(OrderRequest orderRequest);
    public List<OrderRequest> getOrderRequest();
    public OrderRequest getOrderRequestById(Integer orderID);
    public List<OrderRequest> getOrderRequestList(PersonalTrainer personalTrainer);
    public void deleteOrder(Integer orderId);
    public  boolean checkGymerOrderExist(Integer gymerID,OrderStatus orderStatus);

    public List<OrderRequest> getOrderList(PersonalTrainer personalTrainer, OrderStatus orderStatus);

    public List<OrderRequest> getOrderHistoryGymer(Gymer gymer);
}
