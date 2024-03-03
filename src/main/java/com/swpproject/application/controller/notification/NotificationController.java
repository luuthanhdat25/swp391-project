package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import org.hibernate.resource.beans.container.internal.JpaCompliantLifecycleStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Dictionary;
import java.util.List;

@Controller
public class NotificationController {
    @Autowired private NotificationRepository notificationRepository;
    @Autowired private AccountRepository accountRepository;


    @RequestMapping(value = "/admin-home", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewAdminHome(ModelMap modelMap) {
        List<Notification> notifications = notificationRepository.findAll();
        modelMap.addAttribute("NotificationList", notifications);
        return "admin/admin-home";
    }

    @RequestMapping(value = "/view-notification-list", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNotificationList(ModelMap modelMap) {
        List<Notification> notifications = notificationRepository.findAll();
        modelMap.addAttribute("NotificationList", notifications);
        return "notification/view-notification-list";
    }
    @RequestMapping(value = "/view-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNotificationDetail(ModelMap modelMap, @RequestParam("notificationId") int notificationId) {
        Notification notification = notificationRepository.findById(notificationId).get();
        modelMap.addAttribute("NotificationDetail", notification);
        return "forward:view-notification-list";
    }
    @RequestMapping(value = "/delete-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String deleteNotificationDetail(@RequestParam("deleteNotificationID") int deleteNotificationID) {
        notificationRepository.deleteById(deleteNotificationID);
        return "forward:view-notification-list";
    }
    private String createPaymentForm(Account senderAccount, Account receiverAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append(" Dear ").append(receiverAccount.getFullName()).append("<br><br>")
                .append("I, ").append(senderAccount.getFullName())
                .append(", as your personal trainer, acknowledge and agree to your request").append("<br>")
                .append("for the training course. I am confident that I can accommodate the time slots for training").append("<br>")
                .append("as per your requirements.").append("<br")
                .append("Below are the details for the course payment:").append("<br>")
                .append("Duration: 3 months (20/4/2024 to 20/7/2024)").append("<br>")
                .append(" Total Cost: 3,600,000đ").append("<br>")
                .append("Payment Method: VNPAY").append("<br>")
                .append("Payment link: payment.com/vnpay").append("<br>")
                .append("Please ensure that the payment is made prior to the commencement of the training").append("<br>")
                .append("sessions to secure your spot. Once the payment is processed, we can proceed with").append("<br>")
                .append("scheduling the training sessions at your convenience.").append("<br><br>")
                .append("Best regards,").append("<br><br>")
                .append(senderAccount.getFullName()).append("<br><br>")
                .append(senderAccount.getPhone());
        return stringBuilder.toString();
    }
    @RequestMapping(value = "/view-creating-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewCreatingNotificationDetail() {
        return "notification/create-notification-detail";
    }
    @RequestMapping(value = "/create-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createNotificationDetail(@RequestParam("title") String notificationTitle,
                                           @RequestParam("content") String notificationContent,
                                           @RequestParam("senderID") int senderId,
                                           @RequestParam("receiverID") int receiverID) {
        Notification notification = new Notification();
        notification.setTitle(notificationTitle);
        notification.setContent(notificationContent);
        notification.setTimeStamp(LocalDateTime.now());
        notification.setFromAccount(senderId);
        notification.setToAccount(receiverID);
        notificationRepository.save(notification);
        return "forward:view-notification-list";
    }
    @RequestMapping(value = "/create-payment-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createPaymentNotificationDetail(ModelMap modelMap,
                                           @RequestParam Integer senderID,
                                           @RequestParam Integer receiverID) {
        Account senderAccount =  accountRepository.findById(senderID).get();
        Account receiverAccount =  accountRepository.findById(receiverID).get();

        Notification paymentNotification = new Notification();
        String content = createPaymentForm(senderAccount, receiverAccount);

        paymentNotification.setContent(content);
        paymentNotification.setTitle("Payment Hiring Personal Trainer");
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(senderID);
        paymentNotification.setToAccount(receiverID);

        notificationRepository.save(paymentNotification);
        return "forward:view-notification-list";
    }
}
