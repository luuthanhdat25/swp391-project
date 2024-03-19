package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "slot_nutrition_detail")
public class SlotNutritionDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private int amount;

    @ManyToOne
    @JoinColumn(name = "nutrition_id", nullable = true)
    private Nutrition nutrition;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "slot_nutrition_id", nullable = true)
    private SlotNutrition slotNutrition;

}
