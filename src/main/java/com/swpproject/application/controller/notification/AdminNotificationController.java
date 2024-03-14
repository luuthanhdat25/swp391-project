package com.swpproject.application.controller.notification;

import com.swpproject.application.dto.AdminNotificationDTO;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.impl.NotificationService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminNotificationController {
    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private AccountService accountService;

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
        } else {
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

    @ResponseBody
    @GetMapping(value = "/get-notification-detail")
    public ResponseEntity<AdminNotificationDTO> getNotificationDetail(@RequestParam int notificationID) {
        Notification notification = notificationRepository.findById(notificationID).get();
        AdminNotificationDTO AdminNotificationDTO = new AdminNotificationDTO();

        AdminNotificationDTO.setAvatarSender(notification.getFromAccount().getAvatarImage());
        AdminNotificationDTO.setTitle(notification.getTitle());
        AdminNotificationDTO.setTimeStamp(notification.getTimeStamp());
        AdminNotificationDTO.setNameSender(notification.getFromAccount().getFullName());
        AdminNotificationDTO.setContentSender(notification.getContent());
        return ResponseEntity.ok().body(AdminNotificationDTO);
    }

    private void createNotificationFollowRole(String title, String url, String role, HttpSession session) {
        List<Account> accounts = accountService.getAccounts();
        int lastId = notificationService.getGroupNumber_LastNotification();

        for (Account account : accounts) {
            if (!account.getRole().getLabel().equals(role)) continue;
            Notification notification = new Notification();
            notification.setTitle(title);
            notification.setTimeStamp(LocalDateTime.now());
            notification.setContent(url);
            notification.setFromAccount((Account) session.getAttribute("account"));
            notification.setToAccount(account);
            notification.setGroupNumber(lastId + 1);
            notificationRepository.save(notification);
        }
    }

    @GetMapping(value = "/send-notification")
    public ResponseEntity<NotificationDTO> createNotification(@RequestParam List<Integer> userAccountsSelected,
                                                              @RequestParam String title,
                                                              @RequestParam String url,
                                                              @RequestParam Boolean isSendToAllGymer,
                                                              @RequestParam Boolean isSendToAllPersonalTrainer,
                                                              HttpSession session) {
        if (isSendToAllGymer) {
            createNotificationFollowRole(title, url, "Gymer", session);
            return ResponseEntity.ok().body(new NotificationDTO());
        }

        if (isSendToAllPersonalTrainer) {
            createNotificationFollowRole(title, url, "Personal Trainer", session);
            return ResponseEntity.ok().body(new NotificationDTO());
        }

        int lastId = notificationService.getGroupNumber_LastNotification();
        Account account;
        for (Integer index : userAccountsSelected) {
            Notification notification = new Notification();
            account = accountRepository.findById(index).get();

            notification.setTimeStamp(LocalDateTime.now());
            notification.setTitle(title);
            notification.setContent(url);
            notification.setFromAccount(account);
            notification.setToAccount(account);
            notification.setGroupNumber(lastId + 1);
            notificationRepository.save(notification);
        }
        return ResponseEntity.ok().body(new NotificationDTO());
    }
}






