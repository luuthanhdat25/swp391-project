package com.swpproject.application.model;
import com.swpproject.application.dto.ExerciseDTOOut;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "exercise")
public class Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String type;

    @Column(columnDefinition = "varchar(MAX)")
    private String description;
    private String level;
    private String equipment;
    private String videoDescription;
    @Lob
    private byte[] imageDescription;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id")
    private PersonalTrainer personalTrainer;
    private int isPrivate;

    // List all fields for details
    public ExerciseDTOOut getExerciseDTOOutAllInfor(){
        ExerciseDTOOut exerciseDTOOut = new ExerciseDTOOut();
        exerciseDTOOut.setId(getId());
        exerciseDTOOut.setName(getName());
        exerciseDTOOut.setType(getType());
        exerciseDTOOut.setDescription(getDescription());
        exerciseDTOOut.setLevel(getLevel());
        exerciseDTOOut.setEquipment(getEquipment());
        exerciseDTOOut.setVideoDescription(getVideoDescription());
        exerciseDTOOut.setImageDescription(getImageDescription());
        exerciseDTOOut.setPersonalTrainer_id(getPersonalTrainer().getId());
        exerciseDTOOut.setPersonalTrainer_image(getPersonalTrainer().getAccount().getAvatarImage());
        return exerciseDTOOut;
    }

    // Reduces the exercise fields for exercise list view
    public ExerciseDTOOut getExerciseDTOOutSlim(){
        ExerciseDTOOut exerciseDTOOut = new ExerciseDTOOut();
        exerciseDTOOut.setId(getId());
        exerciseDTOOut.setName(getName());
        exerciseDTOOut.setType(getType());
        exerciseDTOOut.setLevel(getLevel());
        exerciseDTOOut.setEquipment(getEquipment());
        exerciseDTOOut.setImageDescription(getImageDescription());
        exerciseDTOOut.setPersonalTrainer_id(getPersonalTrainer().getId());
        exerciseDTOOut.setPersonalTrainer_image(getPersonalTrainer().getAccount().getAvatarImage());
        return exerciseDTOOut;
    }
}
