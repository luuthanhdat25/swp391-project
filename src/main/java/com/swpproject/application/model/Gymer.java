package com.swpproject.application.model;
import com.swpproject.application.enums.Goal;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Builder(toBuilder = true)
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

    @Column(name = "goal", columnDefinition = "NVARCHAR(20)")
    private Goal goal;

    @Column(name = "[desc]", columnDefinition = "NVARCHAR(MAX)")
    private String description;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", referencedColumnName = "id")
    private Account account;
}
