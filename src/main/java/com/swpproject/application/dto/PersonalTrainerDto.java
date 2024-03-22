package com.swpproject.application.dto;

import com.swpproject.application.model.Evaluation;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
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
    private String bankName;
    private String bankNumber;
    private String email;
    private String isBan;
    List<byte[]> certificateList;
}