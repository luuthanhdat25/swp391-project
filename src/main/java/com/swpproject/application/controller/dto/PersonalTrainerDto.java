package com.swpproject.application.controller.dto;

import lombok.*;

import java.util.Arrays;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PersonalTrainerDto {
    private Integer id;
    private String description;
    private Integer price;
    private String fullName;
    private String address;
    private String gender;
    private byte[] avatarImage;
    private int numberOfVotes;
    private float averageVotes;
    private String phone;
    private String birthday;
    private String email;
    List<byte[]> certificateList;
}