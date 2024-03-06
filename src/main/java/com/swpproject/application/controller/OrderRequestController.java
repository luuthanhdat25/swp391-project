package com.swpproject.application.controller;


import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.OrderRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderRequestController {


    @Autowired
    private OrderRequestService orderRequestService;

    @RequestMapping("Order-Request")
    public String OrderRequest(Model model,
                               @RequestParam("order_id") int orderID){
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        Gymer gymer = orderRequest.getGymer();
        PersonalTrainer personalTrainer = orderRequest.getPersonalTrainer();
        Account accountProfile = gymer.getAccount();
        model.addAttribute("orderRequest",orderRequest);
        model.addAttribute("account",accountProfile);
        model.addAttribute("gymer",gymer);

        return "order-detail";
    }

    @RequestMapping("order-list")
    public String ViewOrderList(Model model){
        List<OrderRequest> orderRequestList = orderRequestService.getOrderRequest();
        System.out.println(orderRequestList.size());
//        for (OrderRequest orderRequest : orderRequestList) {
//            System.out.println(orderRequestList.toString());
//        }
        model.addAttribute("OrderRequestList",orderRequestList);

        return "view-order";
    }


}
