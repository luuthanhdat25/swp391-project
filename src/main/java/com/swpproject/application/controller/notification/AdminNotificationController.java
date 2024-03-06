package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class AdminNotificationController {
    @Autowired private NotificationRepository notificationRepository;

    @RequestMapping(value = "/admin-home/manage-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewManageNotification(ModelMap modelMap, @RequestParam(name = "papeNo", defaultValue = "1") int papeNo) {
        int pageSize = 8;
        Pageable pageable = PageRequest.of(papeNo - 1, pageSize);
		Page<Notification> notifications = notificationRepository.findAll(pageable);

        modelMap.put("NotificationList", notifications);
        modelMap.put("IndexStarting", pageSize * (papeNo - 1) + 1);
        modelMap.addAttribute("TotalPage", notifications.getTotalPages());
		modelMap.addAttribute("CurrentPage", papeNo);
        return "notification/admin-home-manage-notification";
    }

    @RequestMapping(value = "admin-home/view-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNotificationDetail(ModelMap modelMap, @RequestParam("notificationId") int notificationId) {
        Notification notification = notificationRepository.findById(notificationId).get();
        modelMap.addAttribute("NotificationDetail", notification);
        return "notification/admin-home-view-notification-detail";
    }

    @RequestMapping(value = "admin-home/create-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
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
        return "forward:manage-notification";
    }

    @RequestMapping(value = "admin-home/delete-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String deleteNotificationDetail(@RequestParam("deleteNotificationID") int deleteNotificationID) {
        notificationRepository.deleteById(deleteNotificationID);
        return "forward:manage-notification";
    }

    @RequestMapping(value = "admin-home/view-creating-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewCreatingNotificationDetail() {
        return "notification/admin-home-create-notification";
    }
}
