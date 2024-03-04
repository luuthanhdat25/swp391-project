package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.model.Report;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.repository.ReportRepository;
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
    @Autowired private  SystemNotificationHandler systemNotificationHandler;
    @Autowired private NotificationRepository notificationRepository;
    @Autowired private AccountRepository accountRepository;

    @RequestMapping(value = "/admin-home/manage-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewManageNotification(ModelMap modelMap) {
        List<Notification> notifications = notificationRepository.findAll();
        modelMap.addAttribute("NotificationList", notifications);
        return "admin/admin-home-manage-notification";
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

    @RequestMapping(value = "admin-home/view-creating-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
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
        String content = systemNotificationHandler.createNotificationContent_AcceptedHiring(senderAccount, receiverAccount);

        paymentNotification.setContent(content);
        paymentNotification.setTitle("Payment Hiring Personal Trainer");
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(senderID);
        paymentNotification.setToAccount(receiverID);

        notificationRepository.save(paymentNotification);
        return "forward:view-notification-list";
    }
}
