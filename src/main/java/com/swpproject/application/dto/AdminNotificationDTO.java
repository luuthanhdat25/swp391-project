package com.swpproject.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AdminNotificationDTO {
    private String title;
    private byte[] avatarSender;
    private LocalDateTime timeStamp;
    private String nameSender;
    private String contentSender;
}
