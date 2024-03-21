package com.swpproject.application.controller.order_gymer;


import com.swpproject.application.enums.Attendant;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class OrderGymer {


    @Autowired private GymerService gymerService;
    @Autowired private OrderRequestService orderRequestService;
    @Autowired private PersonalTrainerService personalTrainerService;
    @Autowired private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired private ExerciseService exerciseService;
    @Autowired private  SlotExeDetailService slotExeDetailService;


    @RequestMapping("order-history")
    public String orderHistory(Model model, HttpSession session){
        Gymer gymer = (Gymer) session.getAttribute("gymer");
        List<OrderRequest> orderHistory = orderRequestService.getOrderHistoryGymer(gymer);
        System.out.println("Order History: "+ orderHistory.size());
        model.addAttribute("OrderHistory",orderHistory);
        return "order-history";
    }


    @RequestMapping("gymer-orderdetail")
    public String OrderHistoryDetail(@RequestParam(value = "order_id",required = false) Integer orderID,
                                     Model model){
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        List<SlotExercise> orderDetail = slotExcerciseEntityService.getSlotByOrder(orderID);
        model.addAttribute("allSlots",orderDetail);
        model.addAttribute("orderRequest",orderRequest);
        return "order-detail";
    }

    @RequestMapping(value = "insert-exercise-detail", method = RequestMethod.POST)
    public String saveOrderDetail(@RequestParam(name = "description") String description,
                                  @RequestParam(name = "slotId") Integer slotId,
                                  @RequestParam("exerciseDataInput") String exerciseDataJson,
                                  @RequestParam(value = "week",required = false) int week,
                                  @RequestParam(value = "year", required = false) int year,
                                  @RequestParam(value = "attendant",required = false) String attendant,
                                  @RequestParam(value = "currentURL", required = false) String currentURL,
                                  RedirectAttributes redirectAttributes,
                                  HttpSession session, HttpServletRequest request) {

        System.out.println("Description: " + description);
        System.out.println("Slot ID: " + slotId);
        System.out.println("Exercise Data JSON: " + exerciseDataJson);
        System.out.println("current url" + currentURL);
        // Loại bỏ dấu '[' và ']'

        if(!exerciseDataJson.equalsIgnoreCase("[]")){
            String cleanJson = exerciseDataJson.substring(1, exerciseDataJson.length() - 1);

            // Tách chuỗi thành các cặp key-value
            String[] keyValuePairs = cleanJson.split("},");
            if(keyValuePairs.length >= 1){
                // Lặp qua từng cặp key-value
                for (String pair : keyValuePairs) {
                    // Loại bỏ dấu '{' ở đầu cặp
                    if (pair.startsWith("{")) {
                        pair = pair.substring(1);
                    }
                    // Loại bỏ dấu '}' ở cuối cặp
                    if (pair.endsWith("}")) {
                        pair = pair.substring(0, pair.length() - 1);
                    }
                    // Tách cặp key-value thành key và value
                    String[] keyValue = pair.split(",");
                    Integer exerciseId = null;
                    int set = 0;
                    int rep = 0;
                    for (String kv : keyValue) {
                        // Tách key và value
                        String[] parts = kv.split(":");
                        String key = parts[0].trim().replaceAll("\"", ""); // Loại bỏ dấu '"' ở đầu và cuối key
                        String value = parts[1].trim().replaceAll("\"", ""); // Loại bỏ dấu '"' ở đầu và cuối value

                        // Gán giá trị tương ứng cho exerciseId, set và rep
                        if ("exerciseId".equals(key)) {
                            exerciseId = Integer.parseInt(value);
                        } else if ("set".equals(key)) {
                            set = Integer.parseInt(value);
                        } else if ("rep".equals(key)) {
                            rep = Integer.parseInt(value);
                        }
                    }
                    // In ra giá trị đã trích xuất
                    System.out.println("Exercise ID: " + exerciseId + ", Set: " + set + ", Rep: " + rep);
                    SlotExerciseDetail slotExerciseDetail = new SlotExerciseDetail();
                    slotExerciseDetail.setSlotExercise(slotExcerciseEntityService.getSlotByID(slotId));
                    slotExerciseDetail.setRep(rep);
                    slotExerciseDetail.setSetExe(set);
                    slotExerciseDetail.setExercise(exerciseService.getExercisebyID(exerciseId).get());
                    slotExeDetailService.save(slotExerciseDetail);
                }
            }
        }else {
            if(attendant!= ""){
                if(attendant.equalsIgnoreCase("PRESENT")){
                    updateAttendantPresent(slotExcerciseEntityService.getSlotByID(slotId),Attendant.PRESENT);
                }else if(attendant.equalsIgnoreCase("ABSENT")){
                    updateAttendantPresent(slotExcerciseEntityService.getSlotByID(slotId),Attendant.ABSENT);
                }

            }
        }

        // In ra URL hiện tại để kiểm tra
        System.out.println("Current URL: " + currentURL);
//        session.setAttribute("currentURL",currentURL);
        // Trả về URL hiện tại
        return "redirect:" +currentURL;
    }


    @RequestMapping("delete-detail")
    public String deleteDetail(@RequestParam(value = "slotDetailID", required = false) Integer slotDetailID,
                               @RequestParam(value = "week",required = false) int week,
                               @RequestParam(value = "year", required = false) int year,
                               HttpSession session,
                               RedirectAttributes redirectAttributes){
        String currentURL = (String) session.getAttribute("currentURL");
        System.out.println("currentURL: " + currentURL);
        System.out.println("slotID: " +  slotDetailID);
        slotExeDetailService.deleteExerciseDetail(slotDetailID);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:" + currentURL;
    }

    public void updateTrackingPresent(OrderRequest orderRequest){
        List<SlotExercise> orderSize = slotExcerciseEntityService.GetSlotOfOrder(orderRequest);
        Integer trackingUpdate = orderRequest.getTranking();
        double updateValue = 1.0 / orderSize.size() * 100;
        trackingUpdate += (int) Math.ceil(updateValue);
        orderRequest.setTranking(trackingUpdate);
        orderRequestService.saveOrUpdateOrderRequest(orderRequest);
    }//hàm update lại các giá trị tracking cho order request.
    public void updateTrackingAbsent(OrderRequest orderRequest){
        List<SlotExercise> orderSize = slotExcerciseEntityService.GetSlotOfOrder(orderRequest);
        Integer trackingUpdate = orderRequest.getTranking();
        double updateValue = 1.0 / orderSize.size() * 100;
        trackingUpdate -= (int) Math.ceil(updateValue);
        orderRequest.setTranking(trackingUpdate);
        orderRequestService.saveOrUpdateOrderRequest(orderRequest);
    }
    public void updateAttendantPresent(SlotExercise slotExercise, Attendant attendant){
        if(slotExercise.getAttendantStatus() != attendant){
            slotExercise.setAttendantStatus(attendant);
            slotExcerciseEntityService.SaveSlotExcercise(slotExercise);
            if(attendant ==Attendant.PRESENT) updateTrackingPresent(slotExercise.getOrderRequest());
            else updateTrackingAbsent(slotExercise.getOrderRequest());
        }
    } // update giá trị update lại các gia trị attendant

}
