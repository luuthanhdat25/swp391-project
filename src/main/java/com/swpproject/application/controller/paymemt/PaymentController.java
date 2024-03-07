package com.swpproject.application.controller.paymemt;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.OrderRequestService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PaymentController {
    private IPaymentStrategy paymentStrategy;
    @Autowired private OrderRequestService orderRequestService;

    public void setPaymentStrategy(IPaymentStrategy paymentStrategy) {
        this.paymentStrategy = paymentStrategy;
    }

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public String processPayment(@RequestParam("orderID") Integer orderID,
                                 HttpSession session) {
        //Default
        if(paymentStrategy == null) setPaymentStrategy(new VNPayPayment());

        if (paymentStrategy != null) {
            OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
            session.setAttribute("orderPayment",orderRequest);
            System.out.println("order request:"+orderRequest.getOrderId());
            return "redirect:" + paymentStrategy.processPayment(orderRequest.getTotal_of_money());
        } else {
            System.out.println("No payment strategy selected.");
            return null;
        }
    }

    @GetMapping("/pay/result")
    public String successPayment(@RequestParam("vnp_ResponseCode") String responseCode,
                                 Model model,HttpSession session) {
        if ("00".equals(responseCode)) {
            OrderRequest orderRequest = (OrderRequest) session.getAttribute("orderPayment");
            PersonalTrainer personalTrainer = orderRequest.getPersonalTrainer();
            Account account = personalTrainer.getAccount();
            model.addAttribute("accountOrder",personalTrainer);
            model.addAttribute("accountPTOrder",account);
            System.out.println("order request session:"+orderRequest.getOrderId());

            return "pay-success";
        } else {
            return "pay-fail";
        }
    }
}
