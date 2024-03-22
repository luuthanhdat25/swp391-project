package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.service.NutritionService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value ="/api/nutritions")
public class NutritionRestController {

    @Autowired
    private NutritionService nutritionService;

    private enum SortEnum{LowCalo, LowFat, HighProtein, NoSort}

    @PostMapping("/search")
    public ResponseEntity<List<NutritionDTOOut>> searchNutritions(
            @RequestBody FilterObject filterObject,
            HttpServletRequest request
    ) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);

        nutritionDTOOutList = findByNameContaining(filterObject.getSearchName(), nutritionDTOOutList);
        SortEnum sortEnum = getSortSearchEnum(filterObject);
        nutritionDTOOutList = sortEnum == SortEnum.NoSort
                                        ? filterAllCategory(filterObject, nutritionDTOOutList)
                                        : sortByCategory(sortEnum, nutritionDTOOutList);

        return ResponseEntity.ok().body(nutritionDTOOutList);
    }

    @GetMapping("/personal-trainer")
    public ResponseEntity<List<NutritionDTOOut>> searchNutritionDTOOutPT(
            @RequestParam String search, @RequestParam int option, HttpServletRequest request)
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        List<NutritionDTOOut> myNutritionLit = getMyNutrition(roleDTO.getId(), nutritionDTOOutList);
        myNutritionLit = findByNameContaining(search, myNutritionLit);
        myNutritionLit = getListNutritionIsActive(option, myNutritionLit);
        return ResponseEntity.ok().body(myNutritionLit);
    }

    @GetMapping("/admin")
    public ResponseEntity<List<NutritionDTOOut>> searchNutritionDTOOutAdmin(
            @RequestParam String search, @RequestParam int option, HttpServletRequest request)
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        nutritionDTOOutList = findByNameContaining(search, nutritionDTOOutList);
        if(option == 0){
            nutritionDTOOutList = nutritionDTOOutList.stream()
                    .filter(exerciseDTOOut -> exerciseDTOOut.getPersonalTrainerImage() == null)
                    .collect(Collectors.toList());
        }

        return ResponseEntity.ok().body(nutritionDTOOutList);
    }

    private List<NutritionDTOOut> getMyNutrition(int id, List<NutritionDTOOut> nutritionDTOOutList){
        return nutritionDTOOutList.stream()
                .filter(nutrition -> nutrition.getPersonalTrainerId() == id)
                .collect(Collectors.toList());
    }

    private List<NutritionDTOOut> getListNutritionIsActive(int option, List<NutritionDTOOut> nutritionDTOOutList){
        if(option == 2) return nutritionDTOOutList;
        return nutritionDTOOutList.stream()
                .filter(nutrition -> nutrition.getIsPrivate() == option)
                .collect(Collectors.toList());
    }

    private SortEnum getSortSearchEnum(FilterObject filterObject){
        if(filterObject.getCaloMin() == filterObject.getCaloMax()) return SortEnum.LowCalo;
        if(filterObject.getFatMax() == filterObject.getFatMin()) return SortEnum.LowFat;
        if(filterObject.getProteinMax() == filterObject.getProteinMin()) return SortEnum.HighProtein;
        return SortEnum.NoSort;
    }

    private List<NutritionDTOOut> filterAllCategory(FilterObject filterObject, List<NutritionDTOOut> nutritionDTOOutList){
        nutritionDTOOutList = findByCaloRange(filterObject.getCaloMin(), filterObject.getCaloMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByProteinRange(filterObject.getProteinMin(), filterObject.getProteinMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByFatRange(filterObject.getFatMin(), filterObject.getFatMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByCarbRange(filterObject.getCarbMin(), filterObject.getCarbMax(), nutritionDTOOutList);
        return nutritionDTOOutList;
    }

    private List<NutritionDTOOut> sortByCategory(SortEnum sortEnum, List<NutritionDTOOut> nutritionDTOOutList) {
        Comparator<NutritionDTOOut> comparator = null;

        if (sortEnum == SortEnum.LowCalo) {
            comparator = Comparator.comparing(NutritionDTOOut::getCaloIn);
        } else if (sortEnum == SortEnum.LowFat) {
            comparator = Comparator.comparing(NutritionDTOOut::getFat);
        } else if (sortEnum == SortEnum.HighProtein) {
            comparator = Comparator.comparing(NutritionDTOOut::getProtein).reversed();
        }

        if (comparator != null) {
            nutritionDTOOutList.sort(comparator);
        }

        return nutritionDTOOutList;
    }

    private List<NutritionDTOOut> findByNameContaining(String keyword, List<NutritionDTOOut> nutritionDTOOutList) {
        if(keyword == null) return nutritionDTOOutList;
        String finalKeyword = keyword.toLowerCase();
        return nutritionDTOOutList.stream()
                .filter(nutritionDTOOut -> nutritionDTOOut.getName().toLowerCase().contains(finalKeyword))
                .collect(Collectors.toList());
    }

    private List<NutritionDTOOut> findByRange(List<NutritionDTOOut> nutritionDTOOutList, Predicate<NutritionDTOOut> filter) {
        return nutritionDTOOutList.stream()
                .filter(filter)
                .collect(Collectors.toList());
    }

    private List<NutritionDTOOut> findByCaloRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> caloFilter = nutritionDTOOut -> nutritionDTOOut.getCaloIn() >= min && max >= nutritionDTOOut.getCaloIn();
        return findByRange(nutritionDTOOutList, caloFilter);
    }

    private List<NutritionDTOOut> findByProteinRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> proteinFilter = nutritionDTOOut -> nutritionDTOOut.getProtein() >= min && max >= nutritionDTOOut.getProtein();
        return findByRange(nutritionDTOOutList, proteinFilter);
    }

    private List<NutritionDTOOut> findByFatRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> fatFilter = nutritionDTOOut -> nutritionDTOOut.getFat() >= min && max >= nutritionDTOOut.getFat();
        return findByRange(nutritionDTOOutList, fatFilter);
    }

    private List<NutritionDTOOut> findByCarbRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> carbFilter = nutritionDTOOut -> nutritionDTOOut.getCarb() >= min && max >= nutritionDTOOut.getCarb();
        return findByRange(nutritionDTOOutList, carbFilter);
    }
}

@Getter
@Setter
@NoArgsConstructor
class FilterObject {
    private String searchName;
    private int caloMin;
    private int caloMax;
    private int proteinMin;
    private int proteinMax;
    private int fatMin;
    private int fatMax;
    private int carbMin;
    private int carbMax;
}