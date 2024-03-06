package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.Orders;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.repository.OrderRepository;
import com.swpproject.application.repository.OrderRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.Period;

@Controller
public class SystemNotificationController {
    @Autowired private AccountRepository accountRepository;
    @Autowired private NotificationRepository notificationRepository;
    @Autowired private OrderRequestRepository orderRequestRepository;

    //Notification: When the Personal Trainer accepts Gymer's recruitment request, the system will send a notification
    //accepting the recruitment request and a payment link to Gymer.
    public String createNotificationContent_AcceptedHiring(Account senderAccount, Account receiverAccount, OrderRequest orderDetail, String linkPayment) {
        Period period = Period.between(orderDetail.getDatetime_start().toLocalDate(), orderDetail.getDatetime_end().toLocalDate());
        StringBuilder stringBuilder = new StringBuilder()
                .append("Dear ").append(receiverAccount.getFullName()).append("<br><br>")
                .append("I, ").append(senderAccount.getFullName())
                .append(", as your personal trainer, acknowledge and agree to your request").append("<br>")
                .append("for the training course. I am confident that I can accommodate the time slots for training").append("<br>")
                .append("as per your requirements.").append("<br")
                .append("Below are the details for the course payment:").append("<br>")
                .append("Duration: ").append(period.getYears() * 12 + period.getMonths()).append(" months ")
                .append(period.getDays()).append(" Day ")
                .append(orderDetail.getDatetime_start()).append(" to ").append(orderDetail.getDatetime_end()).append("<br>")
                .append(" Total Cost: ").append(orderDetail.getTotal_of_money()).append("<br>")
                .append("Payment Method: VNPAY").append("<br>")
                .append("Payment link: ").append(linkPayment).append("<br>")
                .append("Please ensure that the payment is made prior to the commencement of the training").append("<br>")
                .append("sessions to secure your spot. Once the payment is processed, we can proceed with").append("<br>")
                .append("scheduling the training sessions at your convenience.").append("<br><br>")
                .append("Best regards,").append("<br><br>")
                .append(senderAccount.getFullName()).append("<br><br>")
                .append(senderAccount.getPhone());
        return stringBuilder.toString();
    }

    @RequestMapping(value = "/create-accepted-and-payment-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createNotification_AcceptedHiringAndPayment(@RequestParam Integer senderID,
                                                              @RequestParam Integer receiverID,
                                                              @RequestParam Integer orderID) {
        Account senderAccount =  accountRepository.findById(senderID).get();
        Account receiverAccount =  accountRepository.findById(receiverID).get();
        OrderRequest orderDetail = orderRequestRepository.findById(orderID).get();
        Notification paymentNotification = new Notification();

        String linkPayment = "payment.com/vnpay";
        String content = createNotificationContent_AcceptedHiring(senderAccount, receiverAccount, orderDetail, linkPayment);

        paymentNotification.setContent(content);
        paymentNotification.setTitle("Payment Hiring Personal Trainer");
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(senderID);
        paymentNotification.setToAccount(receiverID);

        notificationRepository.save(paymentNotification);
        return "forward:view-notification-list";
    }

    //Notification: When Guest created an account and login into system in the first time, the system will send a notification
     public String createNotificationContent_Welcome(Account receiverAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append("<p><b>Dear </b></p>").append(receiverAccount.getFullName()).append(", <br><br>")
                .append("<p>Congratulations! Your registration has been successfully completed. Welcome to our fitness and nutrition management system.</p>")
                .append("<p>Your account is now active, and you can start enjoying the benefits of personalized workout plans and nutrition guidance. Connect with your personal trainer, update your profile, and explore the various features to make the most out of your fitness journey.</p>")
                .append("<p>If you have any questions or need assistance, feel free to reach out to our support team at [support@email.com].</p>")
                .append("<ul><li>Thank you for choosing our platform.</li></ul><p><br></p>");
        return stringBuilder.toString();
    }

    @RequestMapping(value = "/create-welcome-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createNotification_Welcome(@RequestParam Integer receiverID) {
        Account receiverAccount =  accountRepository.findById(receiverID).get();
        Notification paymentNotification = new Notification();
        String content = createNotificationContent_Welcome(receiverAccount);

        paymentNotification.setContent(content);
        paymentNotification.setTitle("Welcome");
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(0);
        paymentNotification.setToAccount(receiverID);

        notificationRepository.save(paymentNotification);
        return "forward:view-notification-list";
    }
}
