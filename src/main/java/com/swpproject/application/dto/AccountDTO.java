package com.swpproject.application.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder(toBuilder = true)
public class AccountDTO {
    private Integer id;
    private byte[] image;
    private String fullName;
    private String role;
}