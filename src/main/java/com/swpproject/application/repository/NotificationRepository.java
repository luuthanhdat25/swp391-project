package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {
    public List<Notification> getNotificationByToAccount(Account toAccount);
}
