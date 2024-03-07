package com.swpproject.application.controller;


import com.swpproject.application.controller.notification.SystemNotificationService;
import com.swpproject.application.model.*;
import com.swpproject.application.service.OrderRequestService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Controller
public class OrderRequestController {


    @Autowired
    private OrderRequestService orderRequestService;
    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired
    private SystemNotificationService systemNotificationService;

    @RequestMapping("Order-Request")
    public String OrderRequest(Model model,
                               @RequestParam("order_id") Integer orderID,
                               RedirectAttributes redirectAttributes) {
        OrderRequest orderRequest = orderRequestService.getOrderRequestById(orderID);
        Gymer gymer = orderRequest.getGymer();
        PersonalTrainer personalTrainer = orderRequest.getPersonalTrainer();
        Account accountProfile = gymer.getAccount();
        model.addAttribute("orderRequest", orderRequest);
        model.addAttribute("account", accountProfile);
        model.addAttribute("gymer", gymer);
        List<SlotExercise> slotOrder = slotExcerciseEntityService.findSlotOrder(orderID, true);
        model.addAttribute("DateStart",orderRequest.getDatetime_start());
        model.addAttribute("DateEnd",orderRequest.getDatetime_end());
        LocalDate currentDate;
        Date StartDateAsDate;


        currentDate = LocalDate.now();
        StartDateAsDate = Date.valueOf(currentDate);


        List<SlotExercise> slotOrdered = slotExcerciseEntityService.getSlotGreater(StartDateAsDate, false);
        for (SlotExercise slotExerciseGoing : slotOrdered) {
            for (SlotExercise slotExerciseWaiting : slotOrder) {
                if (slotExerciseWaiting.getWeek() == slotExerciseGoing.getWeek()
                        && slotExerciseWaiting.getYear() == slotExerciseGoing.getYear()
                        && slotExerciseWaiting.getDay().equalsIgnoreCase(slotExerciseGoing.getDay())
                        && slotExerciseWaiting.getStart_hour().equalsIgnoreCase(slotExerciseGoing.getStart_hour())
                        && slotExerciseWaiting.getEnd_hour().equalsIgnoreCase(slotExerciseGoing.getEnd_hour())){
                        model.addAttribute("MSG","confict schedule");
                }
            }
        }
        //check conflic slot with previous accepted slot
        System.out.println(slotOrder.size());
        model.addAttribute( "allSlots", slotOrder);
        systemNotificationService.createNotification_NewRequestHiring(gymer.getGymerId(), personalTrainer.getId()); //BAO: notification
//        redirectAttributes.addAttribute("accountId", accountId);
//        redirectAttributes.addAttribute("week", week);
//        redirectAttributes.addAttribute("year", year);
        return "order-detail";
    }


    @RequestMapping(value = "accept-order", method = RequestMethod.POST)
    public String AcceptOrder(@RequestParam("order") Integer orderID,
                              @RequestParam("slotOrder") List<SlotExercise> slotOrder
    ) {
        System.out.println("order ID: " + orderID);
        System.out.println("slotList: " + slotOrder.size());
        for (SlotExercise slotExercise : slotOrder) {
            System.out.println(slotExercise.toString());
            slotExcerciseEntityService.updateSlotOrderPending(slotExercise.getId(), false);
        }

        systemNotificationService.createNotification_AcceptedHiringAndPayment(orderID); //BAO: notification
        return "redirect:/order-list";
    }

    @RequestMapping("order-list")
    public String ViewOrderList(Model model) {
        List<OrderRequest> orderRequestList = orderRequestService.getOrderRequest();
        System.out.println(orderRequestList.size());

        model.addAttribute("OrderRequestList", orderRequestList);

        return "view-order";
    }


}
