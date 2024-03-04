package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "personal_trainer")
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

    @OneToOne
    @JoinColumn(name = "account_id",referencedColumnName = "id", nullable = false)
    private Account account;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "personalTrainer", cascade = CascadeType.ALL)
    private List<Certificate> certificates;

    @Override
    public String toString() {
        return "PersonalTrainer{" +
                "id=" + id +
                ", bankName='" + bankName + '\'' +
                ", bankNumber='" + bankNumber + '\'' +
                ", description='" + description + '\'' +
                ", isActive=" + isActive +
                ", price=" + price +
                ", account=" + account +
                ", certificates=" + certificates +
                '}';
    }
}