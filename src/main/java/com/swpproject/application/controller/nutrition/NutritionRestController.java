package com.swpproject.application.controller.nutrition;

import com.swpproject.application.model.NutritionDTOOut;
import com.swpproject.application.service.impl.NutritionServiceIml;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value ="/api/nutritions")
public class NutritionRestController {

    @Autowired
    private NutritionServiceIml nutritionServiceIml;

    @PostMapping("/search")
    public ResponseEntity<List<NutritionDTOOut>> searchNutritions(@RequestBody FilterObject filterObject) {
        List<NutritionDTOOut> nutritionDTOOutList = nutritionServiceIml.getNutritionDTOOutList();
        nutritionDTOOutList = findByNameContaining(filterObject.getSearchName(), nutritionDTOOutList);
        nutritionDTOOutList = findByCaloRange(filterObject.getCaloMin(), filterObject.getCaloMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByProteinRange(filterObject.getProteinMin(), filterObject.getProteinMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByFatRange(filterObject.getFatMin(), filterObject.getFatMax(), nutritionDTOOutList);
        nutritionDTOOutList = findByCarbRange(filterObject.getCarbMin(), filterObject.getCarbMax(), nutritionDTOOutList);
        return ResponseEntity.ok().body(nutritionDTOOutList);
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

    public List<NutritionDTOOut> findByCaloRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> caloFilter = nutritionDTOOut -> nutritionDTOOut.getCaloIn() >= min && max >= nutritionDTOOut.getCaloIn();
        return findByRange(nutritionDTOOutList, caloFilter);
    }

    public List<NutritionDTOOut> findByProteinRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> proteinFilter = nutritionDTOOut -> nutritionDTOOut.getProtein() >= min && max >= nutritionDTOOut.getProtein();
        return findByRange(nutritionDTOOutList, proteinFilter);
    }

    public List<NutritionDTOOut> findByFatRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
        Predicate<NutritionDTOOut> fatFilter = nutritionDTOOut -> nutritionDTOOut.getFat() >= min && max >= nutritionDTOOut.getFat();
        return findByRange(nutritionDTOOutList, fatFilter);
    }

    public List<NutritionDTOOut> findByCarbRange(int min, int max, List<NutritionDTOOut> nutritionDTOOutList) {
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