package com.swpproject.application.repository;

import com.swpproject.application.model.ChatBox;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatBoxRepository extends JpaRepository<ChatBox, Integer> {
}
