package com.swpproject.application.model;

import com.swpproject.application.enums.OrderStatus;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@ToString
@Entity
@Table(name = "order_request")
public class OrderRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderId;
    private String title;
    private String Description;
    private Date datetime_start;
    private Date datetime_end;
    private int total_of_money;
    private Integer tracking;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "Gymer_ID",referencedColumnName = "id",nullable = false)
    private Gymer gymer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PT_ID",referencedColumnName = "id", nullable = false)
    private PersonalTrainer personalTrainer;
    public String getGymerName(){
        return this.gymer.getAccount().getFullName();
    }
    public String getPTName(){
        return this.personalTrainer.getAccount().getFullName();
    }
    public String getStatusString(){
        return  this.status.toString();
    }
}
