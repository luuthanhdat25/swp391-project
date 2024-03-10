package com.swpproject.application.controller.dto;

import com.swpproject.application.enums.Gender;
import com.swpproject.application.model.Account;
import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

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
