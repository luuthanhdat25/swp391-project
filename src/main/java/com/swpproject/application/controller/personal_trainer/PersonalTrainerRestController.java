package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/personal-trainer")
public class PersonalTrainerRestController {
    private final PersonalTrainerRepository personalTrainerRepository;

    public PersonalTrainerRestController(PersonalTrainerRepository personalTrainerRepository) {
        this.personalTrainerRepository = personalTrainerRepository;
    }

    @PostMapping("/search")
    public ResponseEntity<List<PersonalTrainerDto>> searchExercise(@RequestBody FilterObject filterObject) {
        List<PersonalTrainer> personalTrainerList = personalTrainerRepository.findAll();
        personalTrainerList = filterByName(filterObject.getSearchName(), personalTrainerList);
        personalTrainerList = filterByPrice(filterObject.getPriceMin(), filterObject.getPriceMax(), personalTrainerList);
        personalTrainerList = filterByDistance(filterObject.getDistanceMax(), personalTrainerList);
        personalTrainerList = filterByGender(filterObject.getGender(), personalTrainerList);
        List<PersonalTrainerDto> personalTrainerDTOList = getPersonalTrainerDTOList(personalTrainerList);
        return ResponseEntity.ok().body(personalTrainerDTOList);
    }

    private List<PersonalTrainerDto> getPersonalTrainerDTOList(List<PersonalTrainer> personalTrainerList) {
        List<PersonalTrainerDto> personalTrainerDTOList = new ArrayList<>();
        for(PersonalTrainer personalTrainer: personalTrainerList) {
            PersonalTrainerDto dto = new PersonalTrainerDto();
            dto.setId(personalTrainer.getId());
            dto.setDescription(personalTrainer.getDescription());
            dto.setPrice(personalTrainer.getPrice());
            dto.setFullName(personalTrainer.getAccount().getFullName());
            dto.setAddress(personalTrainer.getAccount().getAddress());
            dto.setGender(personalTrainer.getAccount().getGender().getDesc());
            dto.setAvatarImage(personalTrainer.getAccount().getAvatarImage());
            dto.setNumberOfVotes(5);
            dto.setAverageVotes(4.7f);
            personalTrainerDTOList.add(dto);
        }
        return personalTrainerDTOList;
    }

    private List<PersonalTrainer> filterByName(String searchName, List<PersonalTrainer> personalTrainerList) {
        if(searchName.isEmpty()) return personalTrainerList;
        searchName = searchName.toLowerCase();
        String finalSearchName = searchName;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getAccount().getFullName().toLowerCase().contains(finalSearchName))
                .collect(Collectors.toList());
    }

    private List<PersonalTrainer> filterByPrice(Integer priceMin, Integer priceMax, List<PersonalTrainer> personalTrainerList) {
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getPrice() >= priceMin && personalTrainer.getPrice() <= priceMax)
                .collect(Collectors.toList());
    }

    private List<PersonalTrainer> filterByDistance(Integer distanceMax, List<PersonalTrainer> personalTrainerList){
        // Use Google map API
        return personalTrainerList;
    }

    private List<PersonalTrainer> filterByGender(String gender, List<PersonalTrainer> personalTrainerList){
        if(gender.isEmpty()) return personalTrainerList;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getAccount().getGender().getDesc().equalsIgnoreCase(gender))
                .collect(Collectors.toList());
    }
}

@Getter
@Setter
class FilterObject {
    private String searchName;
    private Integer priceMin;
    private Integer priceMax;
    private Integer distanceMax;
    private String gender;
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class PersonalTrainerDTOOut{
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
    private String email;
    List<byte[]> certificateList;
    @Override
    public String toString() {
        return "PersonalTrainerDTO{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", fullName='" + fullName + '\'' +
                ", address='" + address + '\'' +
                ", gender='" + gender + '\'' +
                ", avatarImage=" + Arrays.toString(avatarImage) +
                ", numberOfVotes=" + numberOfVotes +
                ", averageVotes=" + averageVotes +
                ", phone='" + phone + '\'' +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                '}';
    }
}
