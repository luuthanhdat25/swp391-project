package com.swpproject.application.controller.booking;


import com.swpproject.application.controller.notification.SystemNotificationService;
import com.swpproject.application.enums.Attendant;
import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.model.*;
import com.swpproject.application.service.OrderRequestService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@Controller
public class OrderRequestController {


    @Autowired
    private OrderRequestService orderRequestService;
    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired
    private SystemNotificationService systemNotificationService;
    @Autowired private PersonalTrainerService personalTrainerService;
    @RequestMapping("Order-Request")
    public String OrderRequest(Model model,
                               @RequestParam("order_id") Integer orderID,
                               RedirectAttributes redirectAttributes) {
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        Gymer gymer = orderRequest.getGymer();
        PersonalTrainer personalTrainer = orderRequest.getPersonalTrainer();
        Account accountProfile = gymer.getAccount();
        model.addAttribute("orderRequest", orderRequest);
        model.addAttribute("accountOrder", accountProfile);
        model.addAttribute("gymerOrder", gymer);
        List<SlotExercise> slotOrder = slotExcerciseEntityService.GetSlotOfOrder(orderRequest);
        model.addAttribute("DateStart",orderRequest.getDatetime_start());
        model.addAttribute("DateEnd",orderRequest.getDatetime_end());

        // Get ordered slots
        List<SlotExercise> slotOrdered = getOrderedSlots(orderRequest);

        // Check conflicts and get conflicted slots
        List<SlotExercise> slotConflic = checkAndRetrieveConflicts(slotOrdered, slotOrder,gymer);

        // Build and set conflict message
        String conflictMessage = buildConflictMessage(slotConflic);
        model.addAttribute("MSG", conflictMessage);

        // Add attributes to the model
        model.addAttribute("allSlots", slotOrder);
        model.addAttribute("conflicSlot",slotConflic);
        model.addAttribute("orderedSlot",slotOrdered);
        model.addAttribute("orderRequest",orderRequest);

        System.out.println("conflic slot:"+slotConflic.size());
        System.out.println("slot Ordered:" + slotOrdered.size());
        System.out.println("slot ordering: " + slotOrder.size());

        return "order-detail";
    }
    // hàm trả về các slot mà đã được order
    private List<SlotExercise> getOrderedSlots(OrderRequest orderRequest) {
        List<SlotExercise> slotOrdered = new ArrayList<>();
        SlotExercise firstSlotinOrder = slotExcerciseEntityService.getTop1SlotExerciseByOrderID(orderRequest.getOrderId());
        int weekStart = firstSlotinOrder.getWeek();
        int trainingTime = calculateWeeksDifference(orderRequest.getDatetime_start(),orderRequest.getDatetime_end());
        int yearStart = firstSlotinOrder.getYear();
        for (int i = 1; i <= trainingTime; i++) {
            System.out.println("week: " + weekStart);
            List<SlotExercise> slotCheckInTime = slotExcerciseEntityService.getAllSlotNotExcepOrder(weekStart, yearStart,orderRequest);
            System.out.println("check slot in time" + slotCheckInTime.size());
            slotOrdered.addAll(slotCheckInTime);
            if (weekStart < 52) {
                weekStart++;
            } else if (weekStart == 52) {
                weekStart = 1;
                yearStart++;
            }
        }
        return slotOrdered;
    }

    // hàm trả về các slot bị conflic
    private List<SlotExercise> checkAndRetrieveConflicts(List<SlotExercise> slotOrdered, List<SlotExercise> slotOrder, Gymer gymer) {
        List<SlotExercise> slotConflic = new ArrayList<>();
        Hashtable<Integer, List<Integer>> yearConflicts = new Hashtable<>();
        for (SlotExercise slotExerciseGoing : slotOrdered) {
            for (SlotExercise slotExerciseWaiting : slotOrder) {
                if (slotExerciseWaiting.getYear() == slotExerciseGoing.getYear() &&
                        slotExerciseWaiting.getWeek() == slotExerciseGoing.getWeek() &&
                        slotExerciseWaiting.getDay().equalsIgnoreCase(slotExerciseGoing.getDay()) &&
                        slotExerciseWaiting.getStart_hour().equalsIgnoreCase(slotExerciseGoing.getStart_hour()) &&
                        slotExerciseWaiting.getEnd_hour().equalsIgnoreCase(slotExerciseGoing.getEnd_hour())) {
                    SlotExercise slotExerciseConflic = new SlotExercise();
                    slotExerciseConflic.setWeek(slotExerciseWaiting.getWeek());
                    slotExerciseConflic.setYear(slotExerciseWaiting.getYear());
                    slotExerciseConflic.setStart_hour(slotExerciseWaiting.getStart_hour());
                    slotExerciseConflic.setEnd_hour(slotExerciseWaiting.getEnd_hour());
                    slotExerciseConflic.setDay(slotExerciseWaiting.getDay());
                    slotExerciseConflic.setGymer(gymer);
                    slotConflic.add(slotExerciseConflic);
                    System.out.println("week conflic: " + slotExerciseWaiting.getWeek());
                    System.out.println("year conflic: " + slotExerciseWaiting.getYear());
                    System.out.println("day conflic: " + slotExerciseWaiting.getDay());
                    System.out.println("StartHour conflic: " + slotExerciseWaiting.getStart_hour());
                    System.out.println("EndHour conflic: " + slotExerciseWaiting.getEnd_hour());
                    System.out.println("--------------");
                    if (yearConflicts.containsKey(slotExerciseWaiting.getYear())) {
                        yearConflicts.get(slotExerciseWaiting.getYear()).add(slotExerciseWaiting.getWeek());
                    } else {
                        List<Integer> weeks = new ArrayList<>();
                        weeks.add(slotExerciseWaiting.getWeek());
                        yearConflicts.put(slotExerciseWaiting.getYear(), weeks);
                    }
                }
            }
        }
        return slotConflic;
    }
    // hàm trả về các giá trị tuần bị conflic
    private String buildConflictMessage(List<SlotExercise> slotConflic) {
        StringBuilder msgBuilder = new StringBuilder("");
        Hashtable<Integer, List<Integer>> yearConflicts = new Hashtable<>();
        for (SlotExercise slot : slotConflic) {
            if (yearConflicts.containsKey(slot.getYear())) {
                yearConflicts.get(slot.getYear()).add(slot.getWeek());
            } else {
                List<Integer> weeks = new ArrayList<>();
                weeks.add(slot.getWeek());
                yearConflicts.put(slot.getYear(), weeks);
            }
        }

        for (Map.Entry<Integer, List<Integer>> entry : yearConflicts.entrySet()) {
            int year = entry.getKey();
            List<Integer> weeks = entry.getValue();
            msgBuilder.append("Conflic Year ").append(year).append(" (Weeks ").append(weeks).append("), ");
        }

        // Remove the trailing comma and space
        if (msgBuilder.length() > 0) {
            msgBuilder.setLength(msgBuilder.length() - 2);
        }

        return msgBuilder.toString();
    }

    @RequestMapping(value = "accept-order", method = RequestMethod.POST)
    public String AcceptOrder(@RequestParam("order") Integer orderID,
                              @RequestParam("MSG") String MSG,
                              RedirectAttributes redirectAttributes
    ) {

        List<SlotExercise> slotOrder = slotExcerciseEntityService.getSlotByOrder(orderID);
        System.out.println("order ID: " + orderID);
        System.out.println("slotList: " + slotOrder.size());
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        Gymer gymer = orderRequest.getGymer();
        PersonalTrainer personalTrainer = orderRequest.getPersonalTrainer();
        System.out.println();
        if(MSG == null || MSG.trim().isEmpty()){
            orderRequest.setStatus(OrderStatus.Accepted);
            orderRequestService.saveOrUpdateOrderRequest(orderRequest);
            systemNotificationService.createNotification_AcceptedHiringAndPayment(orderRequest); //BAO: notification
            redirectAttributes.addAttribute("amountPay",orderRequest.getTotal_of_money());
            redirectAttributes.addAttribute("orderID",orderID);
            return "redirect:/order-list";
        }else{
            return "redirect:/order-list";
        }
    }

    @RequestMapping("/accept")
    public String AcceptDeclineOrder(HttpSession session){
        OrderRequest orderRequest = (OrderRequest) session.getAttribute("orderPayment");
        List<SlotExercise> slotOrder = slotExcerciseEntityService.getSlotByOrder(orderRequest.getOrderId());
        orderRequest.setStatus(OrderStatus.OnDoing);
        orderRequestService.saveOrUpdateOrderRequest(orderRequest);
        for (SlotExercise slotExercise : slotOrder) {
            System.out.println(slotExercise.toString());
            slotExcerciseEntityService.updateSlotOrderPending(slotExercise.getId(), false);
        }
        systemNotificationService.createNotification_PaymentSuccess(orderRequest);
        session.removeAttribute("orderPayment");
        return "redirect:/view-schedule-withpt";
    }

    @RequestMapping("order-list")
    public String ViewOrderList(Model model,HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(account.getId());
        List<OrderRequest> orderRequestList = orderRequestService.getOrderRequestList(personalTrainer);
        System.out.println(orderRequestList.size());
        model.addAttribute("OrderRequestList", orderRequestList);
        for (OrderRequest orderRequest : orderRequestList) {
            Gymer gymer = orderRequest.getGymer();
            Account accountGymer = gymer.getAccount();
            model.addAttribute("gymer",gymer);
            model.addAttribute("accountOrder",accountGymer);
        }
        return "view-order";
    }
    @RequestMapping(value = "/decline-order")
    public String declineOrder(@RequestParam("orderId")Integer orderId ){
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderId);
        Gymer gymer = orderRequest.getGymer();
        systemNotificationService.createNotification_DeclineHiring(gymer.getAccount(),orderRequest.getPersonalTrainer().getAccount(), orderRequest.getPersonalTrainer().getId());
        slotExcerciseEntityService.deleteSlot(orderId);
        orderRequestService.deleteOrder(orderId);

        return "redirect:/order-list";
    }

    @RequestMapping("customer-list")
    public String viewCustomerList(HttpSession session,Model model){
        PersonalTrainer personalTrainer = (PersonalTrainer) session.getAttribute("personalTrainer");
        List<OrderRequest> orderRequestList = orderRequestService.getOrderList(personalTrainer,OrderStatus.OnDoing);
        System.out.println("order list: " + orderRequestList.size());
        model.addAttribute("OrderList",orderRequestList);
        for (OrderRequest orderRequest : orderRequestList) {
            orderRequest.getGymer().getAccount().getFullName();
            orderRequest.getGymer().getHeight();
        }
        return "customer-list";
    }


    public static int calculateWeeksDifference(Date date1, Date date2) {
        // Chuyển đổi từ java.sql.Date sang LocalDate
        LocalDate localDate1 = date1.toLocalDate();
        LocalDate localDate2 = date2.toLocalDate();

        // Tính khoảng cách theo số tuần
        int weeksDifference = (int) ChronoUnit.WEEKS.between(localDate1, localDate2);

        return Math.abs(weeksDifference); // Trả về giá trị tuyệt đối
    }// Hàm trả về khoảng cách tuần giữa 2 ngày

    public static int getWeekOfYear(Date sqlDate) {
        // Chuyển đổi từ java.sql.Date sang java.time.LocalDate
        LocalDate localDate = sqlDate.toLocalDate();

        // Xác định tuần trong năm
        int weekOfYear = localDate.get(WeekFields.ISO.weekOfWeekBasedYear());

        return weekOfYear;
    } // hàm trả về vị trí của tuần có ngày là sqlDate


    public void updateTracking(OrderRequest orderRequest){
        List<SlotExercise> orderSize = slotExcerciseEntityService.GetSlotOfOrder(orderRequest);
        Integer trackingUpdate = orderRequest.getTracking();
        double updateValue = 1.0 / orderSize.size() * 100;
        trackingUpdate += (int) Math.ceil(updateValue);
        orderRequest.setTracking(trackingUpdate);
        orderRequestService.saveOrUpdateOrderRequest(orderRequest);
    }//hàm update lại các giá trị tracking cho order request.
    public void updateAttendantPresent(SlotExercise slotExercise,Attendant attendant){

        if(slotExercise.getAttendantStatus() != attendant){
            slotExercise.setAttendantStatus(attendant);
            slotExcerciseEntityService.SaveSlotExcercise(slotExercise);
            if(attendant ==Attendant.PRESENT) updateTracking(slotExercise.getOrderRequest());
        }

    } // update giá trị update lại các gia trị attendant
}
