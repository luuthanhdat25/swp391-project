package com.swpproject.application.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Builder(toBuilder = true)
@AllArgsConstructor
public class PasswordDto {
    private String currentPassword;
    private String newPassword;
    private String repeatPassword;
}
