package com.swpproject.application.dto;

import com.swpproject.application.enums.RequestStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PersonalTrainerRequestDTO {
    private Integer id;
    private Integer personalTrainerID;
    private String title;
    private String content;
    private LocalDateTime timeStamp;
    private RequestStatus status;
    private byte[] personalTrainerImage;
    private String personalTrainerName;

    private byte[] cerificate_1;
    private byte[] cerificate_2;
    private byte[] cerificate_3;
}