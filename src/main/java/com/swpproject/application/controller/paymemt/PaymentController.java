package com.swpproject.application.controller.paymemt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
            return paymentStrategy.processPayment(amountPay);
        } else {
            System.out.println("No payment strategy selected.");
            return null;
        }
    }

    @RequestMapping(value = "/paysuccess", method = RequestMethod.GET)
    public String successPayment() {
        return "pay-success";
    }

    @RequestMapping(value = "/payfail", method = RequestMethod.GET)
    public String failPayment() {
        return "pay-fail";
    }
}
