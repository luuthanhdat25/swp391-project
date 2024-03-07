package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.CertificateService;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.PersonalTrainerRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/personal-trainer")
public class PersonalTrainerController {
    private final PersonalTrainerRepository personalTrainerRepository;

    private final CertificateService certificateService;

    public PersonalTrainerController(PersonalTrainerRepository personalTrainerRepository, CertificateService certificateService) {
        this.personalTrainerRepository = personalTrainerRepository;
        this.certificateService = certificateService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model) {
        List<PersonalTrainerDTO> personalTrainerDTOList = getPersonalTrainerDTOList();
        String json = JsonUtils.jsonConvert(personalTrainerDTOList);
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }

    private List<PersonalTrainerDTO> getPersonalTrainerDTOList() {
        List<PersonalTrainer> list = personalTrainerRepository.findAll();
        List<PersonalTrainerDTO> personalTrainerDTOList = new ArrayList<>();
        for (PersonalTrainer personalTrainer : list) {
            List<byte[]> certificatList = certificateService.getAllCertificatesData(personalTrainer);
            PersonalTrainerDTO dto = new PersonalTrainerDTO();
            dto.setId(personalTrainer.getId());
            dto.setDescription(personalTrainer.getDescription());
            dto.setPrice(personalTrainer.getPrice());
            dto.setFullName(personalTrainer.getAccount().getFullName());
            dto.setAddress(personalTrainer.getAccount().getAddress());
            dto.setGender(personalTrainer.getAccount().getGender().getDesc());
            dto.setAvatarImage(personalTrainer.getAccount().getAvatarImage());
            dto.setNumberOfVotes(5);
            dto.setAverageVotes(4.7f);
            dto.setCertificateList(certificateService.getAllCertificatesData(personalTrainer));
            personalTrainerDTOList.add(dto);
        }
        return personalTrainerDTOList;
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String view_profile_details(@RequestParam int id, ModelMap model) {
        Optional<PersonalTrainer> personalTrainer = personalTrainerRepository.findById(id);
        PersonalTrainerDTO personalTrainerDTO = getPersonalTrainerDTO(personalTrainer.get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        model.addAttribute("personaltrainer", json);
        return "pt-profile-details";
    }

    private PersonalTrainerDTO getPersonalTrainerDTO(PersonalTrainer personalTrainer) {
        List<byte[]> certificatList = certificateService.getAllCertificatesData(personalTrainer);
        PersonalTrainerDTO dto = new PersonalTrainerDTO();
        dto.setId(personalTrainer.getId());
        dto.setDescription(personalTrainer.getDescription());
        dto.setPrice(personalTrainer.getPrice());
        dto.setFullName(personalTrainer.getAccount().getFullName());
        dto.setAddress(personalTrainer.getAccount().getAddress());
        dto.setGender(personalTrainer.getAccount().getGender().getDesc());
        dto.setAvatarImage(personalTrainer.getAccount().getAvatarImage());
        dto.setNumberOfVotes(5);
        dto.setAverageVotes(4.7f);
        dto.setPhone(personalTrainer.getAccount().getPhone());
        dto.setBirthday(personalTrainer.getAccount().getBirthday().toString());
        dto.setEmail(personalTrainer.getAccount().getEmail());
        dto.setCertificateList(certificatList);
        return dto;
    }


    // UPDATE PROFILE
    @GetMapping("update")
    public String showFormUpdate(@RequestParam int id,
                                 ModelMap model,
                                 HttpSession session) {
        PersonalTrainerDTO personalTrainerDTO = getPersonalTrainerDTO(personalTrainerRepository.findById(id).get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        model.addAttribute("personalTrainerDto", json);
        session.setAttribute("personalTrainer", personalTrainerRepository.findById(id).get());
        return "profile-update";
    }

    @PostMapping("update")
    public String updateProfile(@RequestParam int id,
                                @RequestParam("avatar") String avatar,
                                @RequestParam("fullname") String fullname,
                                @RequestParam("phone") String phone,
                                @RequestParam("gender") String gender,
                                @RequestParam("birthday") String birthday,
                                @RequestParam("address") String address,
                                @RequestParam("price") String price) {
        PersonalTrainer personalTrainer = personalTrainerRepository.findById(id).get();
        Account account = personalTrainer.getAccount();
        account.setFullName(fullname);
        account.setPhone(phone);
        account.setGender(Gender.valueOf(gender));
        account.setAddress(address);
        account.setBirthday(LocalDate.parse(birthday, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        personalTrainer.setAccount(account);
        personalTrainer.setPrice(Integer.valueOf(price));
        personalTrainerRepository.save(personalTrainer);
        return "redirect:/personal-trainer/details?id=" + id;
    }


}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class PersonalTrainerDTO {
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
