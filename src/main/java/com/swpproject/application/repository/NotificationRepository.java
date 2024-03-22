package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {
    public List<Notification> getNotificationByToAccount(Account toAccount);

    @Modifying
    @Transactional
    @Query("DELETE FROM Notification n WHERE n.groupNumber = :groupNumber")
    void deleteByGroupNumber(@Param("groupNumber") int groupNumber);
}
