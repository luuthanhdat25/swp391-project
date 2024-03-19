package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.service.PersonalTrainerService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/personal-trainer")
public class PersonalTrainerRestController {

    @Autowired
    private PersonalTrainerService personalTrainerService;

    private static final String DISTANCEMAXTRIX_API_KEY = "18CgSCithXKouK54gDzHkm10RUS6KEwWAlnel1D6iBOjyBWgp8E91NLl05LkCHEy";
    private static final String DISTANCEMAXTRIX_API_URL = "https://api.distancematrix.ai/maps/api/distancematrix/json";

    @PostMapping("/search")
    public ResponseEntity<List<PersonalTrainerDto>> searchExercise(
            @RequestBody FilterObject filterObject,
            HttpServletRequest request) throws IOException {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<PersonalTrainerDto> personalTrainerDTOList = personalTrainerService.getPersonalTrainerDTOList(roleDTO);
        personalTrainerDTOList = filterByName(filterObject.getSearchName(), personalTrainerDTOList);
        personalTrainerDTOList = filterByPrice(filterObject.getPriceMin(), filterObject.getPriceMax(), personalTrainerDTOList);
        personalTrainerDTOList = filterByGender(filterObject.getGender(), personalTrainerDTOList);

        if(roleDTO != null && roleDTO.getRole() == Role.GYMER){
            HttpSession session = request.getSession();
            Account account = (Account)  session.getAttribute("account");
            String origin = account.getAddress();
            if(origin != null && !origin.isEmpty()){
                System.out.println("distance Max: " + filterObject.getDistanceMax());
                personalTrainerDTOList = filterAndSortByDistance(origin, filterObject.getDistanceMax(), personalTrainerDTOList);
            }
        }

        return ResponseEntity.ok().body(personalTrainerDTOList);
    }

    private List<PersonalTrainerDto> filterByName(String searchName, List<PersonalTrainerDto> personalTrainerList) {
        if(searchName.isEmpty()) return personalTrainerList;
        searchName = searchName.toLowerCase();
        String finalSearchName = searchName;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getFullName().toLowerCase().contains(finalSearchName))
                .collect(Collectors.toList());
    }

    private List<PersonalTrainerDto> filterByPrice(Integer priceMin, Integer priceMax, List<PersonalTrainerDto> personalTrainerList) {
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getPrice() >= priceMin && personalTrainer.getPrice() <= priceMax)
                .collect(Collectors.toList());
    }

    private List<PersonalTrainerDto> filterByGender(String gender, List<PersonalTrainerDto> personalTrainerList){
        if(gender.isEmpty()) return personalTrainerList;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getGender().equalsIgnoreCase(gender))
                .collect(Collectors.toList());
    }

    private List<PersonalTrainerDto> filterAndSortByDistance(
            String origin,
            Integer distanceMax,
            List<PersonalTrainerDto> personalTrainerDTOList
    ) throws IOException {
        if(personalTrainerDTOList.isEmpty()) return personalTrainerDTOList;

        List<PersonalTrainerDTOAddressDistance> personalTrainerDtoInDistanceRange =
                filterByDistanceMax(origin, distanceMax, personalTrainerDTOList);

        if(personalTrainerDtoInDistanceRange.isEmpty()) return null;

        Collections.sort(personalTrainerDtoInDistanceRange, Comparator.comparing(PersonalTrainerDTOAddressDistance::getDistance));

        return personalTrainerDtoInDistanceRange.stream()
                .map(PersonalTrainerDTOAddressDistance::getPersonalTrainerDto)
                .collect(Collectors.toList());
    }

    private List<PersonalTrainerDTOAddressDistance> filterByDistanceMax(
            String origin,
            Integer distanceMax,
            List<PersonalTrainerDto> personalTrainerDTOList
    ) {
        List<PersonalTrainerDTOAddressDistance> personalTrainerDTOAddressDistanceList = new CopyOnWriteArrayList<>();
        int taskNumber = personalTrainerDTOList.size();
        CompletableFuture<Void>[] futures = new CompletableFuture[taskNumber];

        for (int i = 0; i < taskNumber; i++) {
            PersonalTrainerDto personalTrainerDto = personalTrainerDTOList.get(i);
            String destination = personalTrainerDto.getAddress();

            int finalI = i;
            futures[i] = CompletableFuture.runAsync(() -> {
                float distance = 0;
                try {
                    distance = getDistanceFromAddressUseAPI(origin, destination);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                System.out.println("Distance from " + origin + " to " + destination + " (Task " + finalI + "): " + distance);

                if (distance >= 0 && distance <= distanceMax) {
                    PersonalTrainerDTOAddressDistance personalTrainerDTOAddressDistance =
                            new PersonalTrainerDTOAddressDistance(personalTrainerDto, distance);
                    personalTrainerDTOAddressDistanceList.add(personalTrainerDTOAddressDistance);
                }
            });
        }

        CompletableFuture<Void> allOfFutures = CompletableFuture.allOf(futures);

        allOfFutures.join();

        return new ArrayList<>(personalTrainerDTOAddressDistanceList);
    }

    private float getDistanceFromAddressUseAPI(String origin, String destination)
            throws IOException
    {
        String urlConnection = getURLConnectionString(origin, destination);
        HttpURLConnection connection = (HttpURLConnection) new URL(urlConnection).openConnection();

        connection.setRequestMethod("GET");
        int responseCode = connection.getResponseCode();
        System.out.println(responseCode);
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            String jsonResponse = response.toString();
            return parseDistance(jsonResponse);
        } else {
//            throw new IOException("Failed to fetch data. Response code: " + responseCode);
            return 9.3f;
        }

    }

    private String getURLConnectionString(String origin, String destination){
        return DISTANCEMAXTRIX_API_URL +
                "?origins=" + origin +
                "&destinations=" + destination +
                "&key=" + DISTANCEMAXTRIX_API_KEY;
    }

    private float parseDistance(String jsonResponse) {
        String regexDistanceExtract = "\"distance\":\\{\"text\":\"";
        String distanceText = jsonResponse.split(regexDistanceExtract)[1].split(" ")[0];
        return Float.parseFloat(distanceText);
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
@AllArgsConstructor
class PersonalTrainerDTOAddressDistance {
    private PersonalTrainerDto personalTrainerDto;
    private Float distance;

    @Override
    public String toString() {
        return "PersonalTrainerDTOAddressDistance{" +
                "Full name=" + personalTrainerDto.getFullName() +
                ", distance=" + distance +
                '}';
    }
}

