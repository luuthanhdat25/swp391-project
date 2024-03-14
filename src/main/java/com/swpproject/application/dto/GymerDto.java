package com.swpproject.application.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class GymerDto {
    private Integer id;
    private String fullName;
    private String address;
    private String gender;
    private byte[] avatarImage;
    private String phone;
    private String birthday;
    private String description;
    private String email;
    private Float weight;
    private Float height;
    private String goal;
}
