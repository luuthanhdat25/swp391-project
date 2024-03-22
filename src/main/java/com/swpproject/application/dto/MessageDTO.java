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
public class MessageDTO {
    private String content;
    private LocalDateTime timeStamp;
    private String senderImage;
    private String senderName;
    private Integer isCurrentUserMessage;
}
