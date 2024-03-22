package com.swpproject.application.controller.notification;

import com.swpproject.application.dto.AdminNotificationDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.impl.NotificationService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.aspectj.weaver.ast.Not;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;
import java.util.function.Predicate;
import java.util.Collections;
import java.util.Comparator;
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

    @RequestMapping(value = "/admin-home/manage-notification", method = RequestMethod.GET)
    public String viewManageNotification(ModelMap modelMap,
                                         @RequestParam(name = "papeNo", defaultValue = "1") int papeNo,
                                         @RequestParam(name = "title", defaultValue = "") String title, HttpSession session) {
        int pageSize = 10;
        Account accountAdmin = (Account) session.getAttribute("admin");
        Pageable pageable = PageRequest.of(papeNo - 1, pageSize);
        Page<GroupNotificationList> groupNotificationListPage = Page.empty();

        modelMap.addAttribute("CurrentPage", papeNo);
        modelMap.put("IndexStarting", pageSize * (papeNo - 1) + 1);
        modelMap.put("title", title);

        if (title == null || title.isEmpty()) {
            List<GroupNotificationList> groupNotificationLists = getGroupNotificationLists(
                    notification -> notification.getFromAccount().getId().equals(accountAdmin.getId()));
            groupNotificationListPage = getNotificationListPage(papeNo, pageSize, groupNotificationLists, pageable);
        }
        else {
            String titleLowerCase = title.toLowerCase();
            List<GroupNotificationList> groupNotificationLists = getGroupNotificationLists(
                    notification -> notification.getTitle().toLowerCase().contains(titleLowerCase)
                    && notification.getFromAccount().getId().equals(accountAdmin.getId()));

            if (groupNotificationLists.isEmpty()) {
                modelMap.put("NotificationList", groupNotificationListPage);
                modelMap.addAttribute("TotalPage", groupNotificationListPage.getTotalPages());
                return "notification/admin-home-manage-notification";
            }
            groupNotificationListPage = getNotificationListPage(papeNo, pageSize, groupNotificationLists, pageable);
        }

        modelMap.put("NotificationList", groupNotificationListPage);
        modelMap.addAttribute("TotalPage", groupNotificationListPage.getTotalPages());
        return "notification/admin-home-manage-notification";
    }

    private Page<GroupNotificationList> getNotificationListPage(int papeNo, int pageSize,
                                         List<GroupNotificationList> groupNotificationLists,
                                         Pageable pageable) {
        int fromIndex = Math.min((papeNo - 1) * pageSize, groupNotificationLists.size() - 1);
        int toIndex = Math.min(fromIndex + pageSize - 1, groupNotificationLists.size() - 1);
        if (fromIndex >= 0) {
            List<GroupNotificationList> pageContent = groupNotificationLists.subList(fromIndex, toIndex + 1);
            return new PageImpl<>(pageContent, pageable, groupNotificationLists.size());
        }
        return Page.empty();
    }

    @NotNull
    private List<GroupNotificationList> getGroupNotificationLists(Predicate<Notification> notificationPredicate) {
        List<Notification> adminNotifications = notificationRepository.findAll().stream()
                .filter(notificationPredicate).collect(Collectors.toList());
        Collections.sort(adminNotifications, Comparator.comparing(Notification::getGroupNumber).reversed());
        List<GroupNotificationList> groupNotificationLists = getGroupNotificationlist(adminNotifications);
        return groupNotificationLists;
    }

    private List<GroupNotificationList> getGroupNotificationlist(List<Notification> notifications) {
        List<GroupNotificationList> groupNotificationLists = new ArrayList<>();
        GroupNotificationList groupNotificationList = new GroupNotificationList();

        if (notifications.isEmpty()) return groupNotificationLists;
        for (int i = 0; i < notifications.size(); i++) {
            if (i != 0 && notifications.get(i).getGroupNumber().equals(notifications.get(i - 1).getGroupNumber())) {
                groupNotificationList.addImageData(notifications.get(i).getToAccount().getAvatarImageAsString());
                continue;
            }
            if (i != 0) groupNotificationLists.add(groupNotificationList);
            groupNotificationList = new GroupNotificationList();
            groupNotificationList.setGroupNumber(notifications.get(i).getGroupNumber());
            groupNotificationList.setTitle(notifications.get(i).getTitle());
            groupNotificationList.setContent(notifications.get(i).getContent());
            groupNotificationList.setTimeStamp(notifications.get(i).getTimeStamp());
            groupNotificationList.addImageData(notifications.get(i).getToAccount().getAvatarImageAsString());
        }
        groupNotificationLists.add(groupNotificationList);
        return groupNotificationLists;
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
                                           @RequestParam("receiverID") Integer receiverID,  HttpSession session) {
        Notification notification = new Notification();
        notification.setTitle(notificationTitle);
        notification.setContent(notificationContent);
        notification.setTimeStamp(LocalDateTime.now());

        Account accountAdmin = (Account) session.getAttribute("admin");
        Account receiverAccount = accountRepository.findById(receiverID).get();

        notification.setFromAccount(accountAdmin);
        notification.setToAccount(receiverAccount);
        notificationRepository.save(notification);
        return "forward:manage-notification";
    }

    @RequestMapping(value = "admin-home/delete-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String deleteNotificationDetail(@RequestParam("groupNumber") Integer groupNumber) {
        notificationRepository.deleteByGroupNumber(groupNumber);
        return "forward:manage-notification";
    }

    @RequestMapping(value = "admin-home/view-creating-notification-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewCreatingNotificationDetail() {
        return "notification/admin-home-create-notification";
    }

    @ResponseBody
    @GetMapping(value = "/get-notification-detail")
    public ResponseEntity<GroupNotificationList> getNotificationDetail(@RequestParam Integer groupNumber) {
        List<Notification> adminNotifications = notificationRepository.findAll().stream()
                .filter(notification -> notification.getGroupNumber() == groupNumber).collect(Collectors.toList());

        GroupNotificationList groupNotificationList = new GroupNotificationList();
        groupNotificationList.setGroupNumber(groupNumber);
        groupNotificationList.setTitle(adminNotifications.get(0).getTitle());
        groupNotificationList.setContent(adminNotifications.get(0).getContent());
        groupNotificationList.setTimeStamp(adminNotifications.get(0).getTimeStamp());
        for (Notification notification: adminNotifications)
            groupNotificationList.addImageData(notification.getToAccount().getAvatarImageAsString());
        return ResponseEntity.ok().body(groupNotificationList);
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
            notification.setFromAccount((Account) session.getAttribute("admin"));
            notification.setToAccount(account);
            notification.setGroupNumber(lastId + 1);
            notificationRepository.save(notification);
        }
        return ResponseEntity.ok().body(new NotificationDTO());
    }
}
