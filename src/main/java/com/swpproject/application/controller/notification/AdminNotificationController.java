package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminNotificationController {
    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private AccountRepository accountRepository;

    @RequestMapping(value = "/admin-home/manage-notification", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewManageNotification(ModelMap modelMap,
                                         @RequestParam(name = "papeNo", defaultValue = "1") int papeNo,
                                         @RequestParam(name = "title", defaultValue = "") String title) {
        int pageSize = 10;
        Pageable pageable = PageRequest.of(papeNo - 1, pageSize);
        Page<Notification> notifications = Page.empty();

        modelMap.put("IndexStarting", pageSize * (papeNo - 1) + 1);
        modelMap.addAttribute("CurrentPage", papeNo);
        modelMap.put("NotificationList", notifications);
        modelMap.put("title", title);

        if (title == null || title.isEmpty()) {

            List<Notification> notificationList = notificationRepository.findAll();
            Collections.sort(notificationList, Comparator.comparing(Notification::getTimeStamp).reversed());

            int fromIndex = Math.min((papeNo - 1) * pageSize, notificationList.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, notificationList.size() - 1);
            if (fromIndex >= 0) {
                List<Notification> pageContent = notificationList.subList(fromIndex, toIndex + 1);
                notifications = new PageImpl<>(pageContent, pageable, notificationList.size());
            }
        }
        else {
            String titleLowerCase = title.toLowerCase();
            List<Notification> notificationFilter = notificationRepository.findAll().stream()
                    .filter(notification -> notification.getTitle().toLowerCase().contains(titleLowerCase))
                    .collect(Collectors.toList());


            if (notificationFilter.isEmpty()) {
                modelMap.addAttribute("TotalPage", notifications.getTotalPages());
                return "notification/admin-home-manage-notification";
            }

            Collections.sort(notificationFilter, Comparator.comparing(Notification::getTimeStamp).reversed());
            int fromIndex = Math.min((papeNo - 1) * pageSize, notificationFilter.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, notificationFilter.size() - 1);
            List<Notification> pageContent = notificationFilter.subList(fromIndex, toIndex + 1);
            notifications = new PageImpl<>(pageContent, pageable, notificationFilter.size());
        }

        modelMap.put("NotificationList", notifications);
        modelMap.addAttribute("TotalPage", notifications.getTotalPages());
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
                                           @RequestParam("senderID") Integer senderID,
                                           @RequestParam("receiverID") Integer receiverID) {
        Notification notification = new Notification();
        notification.setTitle(notificationTitle);
        notification.setContent(notificationContent);
        notification.setTimeStamp(LocalDateTime.now());

        Account senderAccount = accountRepository.findById(senderID).get();
        Account receiverAccount = accountRepository.findById(receiverID).get();

        notification.setFromAccount(senderAccount);
        notification.setToAccount(receiverAccount);
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
