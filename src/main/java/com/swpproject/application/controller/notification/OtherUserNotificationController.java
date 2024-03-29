package com.swpproject.application.controller.notification;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class OtherUserNotificationController {
    @Autowired
    private NotificationRepository notificationRepository;

    @RequestMapping(value = "view-notification-list", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewNotificationList(ModelMap modelMap,
                                       @RequestParam(name = "notificationId", required = false) Integer notificationId) {
        List<Notification> notifications = notificationRepository.findAll();
        Collections.sort(notifications, Comparator.comparing(Notification::getTimeStamp).reversed());

        if (notificationId != null) {
            Notification notificationDetail = notificationRepository.findById(notificationId).get();
            modelMap.addAttribute("NotificationDetail", notificationDetail);
        } else if (!notifications.isEmpty())
            modelMap.addAttribute("NotificationDetail", notifications.get(0));

        modelMap.addAttribute("NotificationList", notifications);
        return "notification/other-user-view-notification-list";
    }

    @RequestMapping(value = "auth/delete-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String deleteNotificationDetail(@RequestParam("deleteNotificationID") int deleteNotificationID) {
        notificationRepository.deleteById(deleteNotificationID);
        return "forward:view-notification-list";
    }

    @ResponseBody
    @GetMapping(value = "/notifications")
    public ResponseEntity<List<NotificationDTO>> getNotifications(ModelMap model, HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        List<Notification> notifications = notificationRepository.getNotificationByToAccount(account);
        List<NotificationDTO> notificationDTOS = new ArrayList<>();
        for (Notification notification : notifications) {
            NotificationDTO newDTO = new NotificationDTO();
            newDTO.setAvatarSender(notification.getFromAccount().getAvatarImage());
            newDTO.setTitle(notification.getTitle());
            newDTO.setTimeStamp(notification.getTimeStamp());
            newDTO.setNameSender(notification.getFromAccount().getFullName());
            newDTO.setContentSender(notification.getContent());
            notificationDTOS.add(newDTO);
        }
        Collections.sort(notificationDTOS, Comparator.comparing(NotificationDTO::getTimeStamp).reversed());
        return ResponseEntity.ok().body(notificationDTOS);
    }
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class NotificationDTO {
    private String title;
    private byte[] avatarSender;
    private LocalDateTime timeStamp;
    private String nameSender;
    private String contentSender;
}