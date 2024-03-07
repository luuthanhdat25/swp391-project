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

    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    @ManyToOne
    @JoinColumn(name = "Gymer_ID",referencedColumnName = "id",nullable = false)
    private Gymer gymer;

    @ManyToOne
    @JoinColumn(name = "PT_ID",referencedColumnName = "id", nullable = false)
    private PersonalTrainer personalTrainer;

    @Override
    public String toString() {
        return "OrderRequest{" +
                "order_id=" + orderId +
                ", title='" + title + '\'' +
                ", Description='" + Description + '\'' +
                ", datetime_start=" + datetime_start +
                ", datetime_end=" + datetime_end +
                ", total_of_money=" + total_of_money +
                ", gymer=" + gymer +
                ", personalTrainer=" + personalTrainer +
                '}';
    }
    public String getGymerName(){
        return this.gymer.getAccount().getFullName();
    }
    public String getPTName(){
        return this.personalTrainer.getAccount().getFullName();
    }
}
