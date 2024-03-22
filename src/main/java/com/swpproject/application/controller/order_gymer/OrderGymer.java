package com.swpproject.application.controller.order_gymer;


import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.OrderRequestService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderGymer {


    @Autowired private GymerService gymerService;
    @Autowired private OrderRequestService orderRequestService;
    @Autowired private PersonalTrainerService personalTrainerService;
    @Autowired private SlotExcerciseEntityService slotExcerciseEntityService;


    @RequestMapping("order-history")
    public String orderHistory(Model model, HttpSession session){
        Gymer gymer = (Gymer) session.getAttribute("gymer");
        List<OrderRequest> orderHistory = orderRequestService.getOrderHistoryGymer(gymer);
        System.out.println("Order History: "+ orderHistory.size());
        model.addAttribute("OrderHistory",orderHistory);
        return "order-history";
    }


    @RequestMapping("gymer-orderdetail")
    public String OrderHistoryDetail(@RequestParam(value = "order_id",required = false) Integer orderID,
                                     Model model){
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        List<SlotExercise> orderDetail = slotExcerciseEntityService.getSlotByOrder(orderID);
        model.addAttribute("allSlots",orderDetail);
        model.addAttribute("orderRequest",orderRequest);
        return "order-detail";
    }

}
