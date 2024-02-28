package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class NotificationController {

    @Autowired
    private NotificationRepository notificationRepository;
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
}
