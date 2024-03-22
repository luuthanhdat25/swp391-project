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
public class ChatBoxDTO {
       private Integer id;
       private String lastContent;
       private LocalDateTime lastTimeStamp;
       private String avatarSender;
       private String nameSender;
}
