package com.swpproject.application.controller.paymemt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class PaymentController {
    private IPaymentStrategy paymentStrategy;

    public void setPaymentStrategy(IPaymentStrategy paymentStrategy) {
        this.paymentStrategy = paymentStrategy;
    }

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String processPayment(int amountPay) {
        //Default
        if(paymentStrategy == null) setPaymentStrategy(new VNPayPayment());

        if (paymentStrategy != null) {
            return "redirect:" + paymentStrategy.processPayment(amountPay);
        } else {
            System.out.println("No payment strategy selected.");
            return null;
        }
    }

    @GetMapping("/pay/result")
    public String successPayment(@RequestParam("vnp_ResponseCode") String responseCode) {
        if ("00".equals(responseCode)) {
            return "pay-success";
        } else {
            return "pay-fail";
        }
    }
}
