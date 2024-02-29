package com.swpproject.application.model;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

import jakarta.persistence.*;
import org.springframework.data.relational.core.mapping.Table;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "gymer")
public class Gymer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer gymerId;

    @Column(name = "weight")
    private Float weight;

    @Column(name = "height")
    private Float height;

    @Column(name = "goal", columnDefinition = "NVARCHAR(MAX)")
    private String goal;

    @OneToOne
    @JoinColumn(name = "account_id", referencedColumnName = "id", nullable = false)
    private Account account;
}
