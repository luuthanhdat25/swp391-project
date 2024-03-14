package com.swpproject.application.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.swpproject.application.controller.dto.PersonalTrainerDto;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Builder(toBuilder = true)
@Entity
@Table(name = "personal_trainer")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PersonalTrainer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "bank_name")
    private String bankName;

    @Column(name = "bank_number")
    private String bankNumber;

    @Column(name = "[desc]", columnDefinition = "varchar(MAX)")
    private String description;

    @Column(name = "is_active", columnDefinition = "BIT DEFAULT 0")
    private Boolean isActive;

    @Column(name = "price")
    private Integer price;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id",referencedColumnName = "id")
    private Account account;

    // None birthday, phone, email, certificate
    public PersonalTrainerDto getPersonalTrainerDTOSlim(){
        return PersonalTrainerDto.builder()
                .id(getId())
                .description(getDescription())
                .price(getPrice())
                .fullName(getAccount().getFullName())
                .address(getAccount().getAddress())
                .gender(getAccount().getGender().getDesc())
                .avatarImage(getAccount().getAvatarImage())
                .numberOfVotes(5)
                .averageVotes(5f)
                .build();
    }
}