package com.swpproject.application.service.impl;

import com.swpproject.application.model.Notification;
import com.swpproject.application.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService {
    @Autowired private NotificationRepository notificationRepository;

    public Integer getGroupNumber_LastNotification() {
        List<Notification> notificationList = notificationRepository.findAll();
        if (notificationList.isEmpty()) return -1;
        return notificationList.get(notificationList.size() - 1).getId();
    }
}
