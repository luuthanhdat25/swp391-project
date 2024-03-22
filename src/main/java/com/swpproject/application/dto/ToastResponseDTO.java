package com.swpproject.application.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ToastResponseDTO {
    private int status;
    private String title;
    private String message;
}
