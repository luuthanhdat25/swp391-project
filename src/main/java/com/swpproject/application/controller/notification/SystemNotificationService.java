package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.repository.OrderRequestRepository;
import com.swpproject.application.service.OrderRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.Period;

@Service
public class SystemNotificationService {
    @Autowired
    private NotificationRepository notificationRepository;

    public void createNotification_AcceptedHiringAndPayment(OrderRequest orderRequest) {
        Notification paymentNotification = new Notification();
        String TITLE_NOTIFICATION_ACCEPTED_AND_PAYMENT = "has accepted the rental request, click here to proceed with the payment";
        String linkPayment = "http://localhost:8080/pay?amountPay=" + orderRequest.getTotal_of_money() + "&orderID=" + orderRequest.getOrderId();

        paymentNotification.setContent(linkPayment);
        paymentNotification.setTitle(TITLE_NOTIFICATION_ACCEPTED_AND_PAYMENT);
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(orderRequest.getPersonalTrainer().getAccount());
        paymentNotification.setToAccount(orderRequest.getGymer().getAccount());
        notificationRepository.save(paymentNotification);
    }

    public void createNotification_NewRequestHiring(OrderRequest orderRequest) {
        Notification requestHiringNotification = new Notification();
        String TITLE_NOTIFICATION_NEW_REQUEST_HIRING = "has sent you a rental request, click to view details";
        String content = "http://localhost:8080/Order-Request?order_id=" + orderRequest.getOrderId();

        requestHiringNotification.setContent(content);
        requestHiringNotification.setTitle(TITLE_NOTIFICATION_NEW_REQUEST_HIRING);
        requestHiringNotification.setTimeStamp(LocalDateTime.now());
        requestHiringNotification.setFromAccount(orderRequest.getGymer().getAccount());
        requestHiringNotification.setToAccount(orderRequest.getPersonalTrainer().getAccount());
        notificationRepository.save(requestHiringNotification);
    }

    public void createNotification_DeclineHiring(Account gymerAccount, Account personalTrainerAccount, Integer personalTrainerID) {
        Notification requestHiringNotification = new Notification();
        String TITLE_NOTIFICATION_DECLINE_HIRING = "has declined your rental request, contact him/her to find out the reason";
        String content = "http://localhost:8080/personal-trainer/details?id=" + personalTrainerID;

        requestHiringNotification.setContent(content);
        requestHiringNotification.setTitle(TITLE_NOTIFICATION_DECLINE_HIRING);
        requestHiringNotification.setTimeStamp(LocalDateTime.now());
        requestHiringNotification.setFromAccount(personalTrainerAccount);
        requestHiringNotification.setToAccount(gymerAccount);
        notificationRepository.save(requestHiringNotification);
    }

    public void createNotification_PaymentSuccess(OrderRequest orderRequest) {
        Notification paymentSuccessToGymer = new Notification();
        String TITLE_NOTIFICATION_PAYMENT_SUCCESS = "has successfully paid for the course, contact him/her to discuss the training program";
        String content = "abc";

        paymentSuccessToGymer.setContent(content);
        paymentSuccessToGymer.setTitle(TITLE_NOTIFICATION_PAYMENT_SUCCESS);
        paymentSuccessToGymer.setTimeStamp(LocalDateTime.now());
        paymentSuccessToGymer.setFromAccount(orderRequest.getGymer().getAccount());
        paymentSuccessToGymer.setToAccount(orderRequest.getGymer().getAccount());
        notificationRepository.save(paymentSuccessToGymer);

        paymentSuccessToGymer.setToAccount(orderRequest.getPersonalTrainer().getAccount());
        notificationRepository.save(paymentSuccessToGymer);
    }
}
