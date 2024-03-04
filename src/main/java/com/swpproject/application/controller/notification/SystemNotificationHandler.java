package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import org.springframework.stereotype.Service;

@Service
public class SystemNotificationHandler {

    //Notification: When the Personal Trainer accepts Gymer's recruitment request, the system will send a notification
    //accepting the recruitment request and a payment link to Gymer.
    public String createNotificationContent_AcceptedHiring(Account senderAccount, Account receiverAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append(" Dear ").append(receiverAccount.getFullName()).append("<br><br>")
                .append("I, ").append(senderAccount.getFullName())
                .append(", as your personal trainer, acknowledge and agree to your request").append("<br>")
                .append("for the training course. I am confident that I can accommodate the time slots for training").append("<br>")
                .append("as per your requirements.").append("<br")
                .append("Below are the details for the course payment:").append("<br>")
                .append("Duration: 3 months (20/4/2024 to 20/7/2024)").append("<br>")
                .append(" Total Cost: 3,600,000đ").append("<br>")
                .append("Payment Method: VNPAY").append("<br>")
                .append("Payment link: payment.com/vnpay").append("<br>")
                .append("Please ensure that the payment is made prior to the commencement of the training").append("<br>")
                .append("sessions to secure your spot. Once the payment is processed, we can proceed with").append("<br>")
                .append("scheduling the training sessions at your convenience.").append("<br><br>")
                .append("Best regards,").append("<br><br>")
                .append(senderAccount.getFullName()).append("<br><br>")
                .append(senderAccount.getPhone());
        return stringBuilder.toString();
    }

    //Notification: When Guest created an account and login into system in the first time, the system will send a notification
     public String createNotificationContent_SuccessfulAccountRegistration(Account receiverAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append("<p><b>Dear </b></p>").append(receiverAccount.getFullName()).append(", <br><br>")
                .append("<p>Congratulations! Your registration has been successfully completed. Welcome to our fitness and nutrition management system.</p>")
                .append("<p>Your account is now active, and you can start enjoying the benefits of personalized workout plans and nutrition guidance. Connect with your personal trainer, update your profile, and explore the various features to make the most out of your fitness journey.</p>")
                .append("<p>If you have any questions or need assistance, feel free to reach out to our support team at [support@email.com].</p>")
                .append("<ul><li>Thank you for choosing our platform.</li></ul><p><br></p>");
        return stringBuilder.toString();
    }
}
