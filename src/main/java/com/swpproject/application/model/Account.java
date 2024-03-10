package com.swpproject.application.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Base64;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder(toBuilder = true)
@Setter
@Data
@Entity
@Table(name = "account")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "gender", length = 1, nullable = false, columnDefinition = "CHAR(1)")
    private Gender gender;

    @Column(name = "phone")
    private String phone;

    @Column(name = "birthday")
    private LocalDate birthday;

    @Column(name = "address", columnDefinition = "NVARCHAR(MAX)")
    private String address;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false, columnDefinition = "varchar(5)")
    private Role role;

    @Column(name = "is_ban", columnDefinition = "BIT DEFAULT 0")
    private Boolean isBan;

    @Lob
    @Column(name = "avatar_image")
    private byte[] avatarImage;

    public String getAvatarImageAsString() {
        return Base64.getEncoder().encodeToString(avatarImage);
    }

}