package com.swpproject.application.controller.notification;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Notification;
import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.NotificationRepository;
import com.swpproject.application.repository.OrderRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.Period;

@Service
public class SystemNotificationService {
    @Autowired private AccountRepository accountRepository;
    @Autowired private NotificationRepository notificationRepository;
    @Autowired private OrderRequestRepository orderRequestRepository;

    //-----------------------------------------------------------------------------------------------------------------------------
    //Notification: When the Personal Trainer accepts Gymer's recruitment request, the system will send a notification
    //accepting the recruitment request and a payment link to Gymer.
    public String createNotificationContent_AcceptedHiring(Account senderAccount, Account receiverAccount, OrderRequest orderDetail, String linkPayment) {
        Period period = Period.between(orderDetail.getDatetime_start().toLocalDate(), orderDetail.getDatetime_end().toLocalDate());
        StringBuilder stringBuilder = new StringBuilder()
                .append("Dear ").append(receiverAccount.getFullName()).append("<br><br>")
                .append("I, ").append(senderAccount.getFullName())
                .append(", as your personal trainer, acknowledge and agree to your request").append("<br>")
                .append("for the training course. I am confident that I can accommodate the time slots for training").append("<br>")
                .append("as per your requirements.").append("<br")
                .append("Below are the details for the course payment:").append("<br>")
                .append("Duration: ").append(period.getYears() * 12 + period.getMonths()).append(" months ")
                .append(period.getDays()).append(" Day ")
                .append(orderDetail.getDatetime_start()).append(" to ").append(orderDetail.getDatetime_end()).append("<br>")
                .append(" Total Cost: ").append(orderDetail.getTotal_of_money()).append("<br>")
                .append("Payment Method: VNPAY").append("<br>")
                .append("Payment link: ").append(linkPayment).append("<br>")
                .append("Please ensure that the payment is made prior to the commencement of the training").append("<br>")
                .append("sessions to secure your spot. Once the payment is processed, we can proceed with").append("<br>")
                .append("scheduling the training sessions at your convenience.").append("<br><br>")
                .append("Best regards,").append("<br><br>")
                .append(senderAccount.getFullName()).append("<br><br>")
                .append(senderAccount.getPhone());
        return stringBuilder.toString();
    }

    public void createNotification_AcceptedHiringAndPayment(Integer orderID) {
        OrderRequest orderDetail = orderRequestRepository.findById(orderID).get();
        Account senderAccount = orderDetail.getPersonalTrainer().getAccount();
        Account receiverAccount = orderDetail.getGymer().getAccount();
        Notification paymentNotification = new Notification();

        String linkPayment = "payment.com/vnpay";
        String TITLE_NOTIFICATION_ACCEPTED_AND_PAYMENT = "Payment Hiring Personal Trainer";
        String content = createNotificationContent_AcceptedHiring(senderAccount, receiverAccount, orderDetail, linkPayment);

        paymentNotification.setContent(content);
        paymentNotification.setTitle(TITLE_NOTIFICATION_ACCEPTED_AND_PAYMENT);
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(senderAccount.getId());
        paymentNotification.setToAccount(receiverAccount.getId());

        notificationRepository.save(paymentNotification);
    }

    //-----------------------------------------------------------------------------------------------------------------------------
    //Notification: When Guest created an account and login into system in the first time, the system will send a notification
     public String createNotificationContent_Welcome(Account receiverAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append("<p><b>Dear </b></p>").append(receiverAccount.getFullName()).append(", <br><br>")
                .append("<p>Congratulations! Your registration has been successfully completed. Welcome to our fitness and nutrition management system.</p>")
                .append("<p>Your account is now active, and you can start enjoying the benefits of personalized workout plans and nutrition guidance. Connect with your personal trainer, update your profile, and explore the various features to make the most out of your fitness journey.</p>")
                .append("<p>If you have any questions or need assistance, feel free to reach out to our support team at [support@email.com].</p>")
                .append("<ul><li>Thank you for choosing our platform.</li></ul><p><br></p>");
        return stringBuilder.toString();
    }

    public void createNotification_Welcome(@RequestParam Integer receiverID) {
        Account receiverAccount =  accountRepository.findById(receiverID).get();
        Notification paymentNotification = new Notification();

        String TITLE_NOTIFICATION_WELCOME = "Welcome";
        String content = createNotificationContent_Welcome(receiverAccount);

        paymentNotification.setContent(content);
        paymentNotification.setTitle(TITLE_NOTIFICATION_WELCOME);
        paymentNotification.setTimeStamp(LocalDateTime.now());
        paymentNotification.setFromAccount(0);
        paymentNotification.setToAccount(receiverID);

        notificationRepository.save(paymentNotification);
    }

     //-----------------------------------------------------------------------------------------------------------------------------
     //Notification: When Guest created an account and login into system in the first time, the system will send a notification
     public String createNotificationContent_NewRequestHiring(Account gymerAccount, Account personalTrainerAccount) {
        StringBuilder stringBuilder = new StringBuilder()
                .append("<p><strong>Dear </strong>").append(personalTrainerAccount.getFullName()).append(",</p>")
                .append("<p>I hope this message finds you well. We're excited to inform you that a new client has expressed interest in training with you. This presents a great opportunity to expand your client base and showcase your expertise.</p>")
                .append("<p><strong>Client Details:</strong></p>")
                .append("<p>Name: ").append(gymerAccount.getFullName()).append("</p>")
                .append("<p>Contact Information: ").append(gymerAccount.getPhone()).append("</p>")
                .append("<p>We kindly request you to reach out to the client at your earliest convenience. Discuss their fitness goals, preferences, and any other details necessary for a successful training partnership.")
                .append(" This initial contact is crucial in establishing a positive rapport and ensuring a tailored fitness experience.</p>")
                .append("<p>Feel free to propose a consultation or assessment session to better understand their needs. If you encounter any challenges or have questions, don't hesitate to get in touch with us.</p>")
                .append("<p><strong>Next Steps:</strong></p>")
                .append("<ul>")
                .append("<li>Contact the client promptly to introduce yourself.</li>")
                .append("<li>Discuss their fitness goals, preferences, and any special considerations.</li>")
                .append("<li>Propose a suitable training plan or schedule.</li>")
                .append("<li>Confirm the first session details.</li>")
                .append("</ul>")
                .append("<p>We appreciate your dedication to providing excellent training services. Best of luck with the new client, and we're confident you'll create a positive and impactful training experience.</p>")
                .append("<p>If you have any concerns or need further assistance, please reach out to us.</p>")
                .append("<p>Thank you for your commitment to excellence.</p>");
        return stringBuilder.toString();
    }

    public void createNotification_NewRequestHiring(Integer gymerID, Integer personalTrainerID) {
        Account gymerAccount =  accountRepository.findById(gymerID).get();
        Account personalTrainerAccount = accountRepository.findById(personalTrainerID).get();
        Notification requestHiringNotification = new Notification();

        String TITLE_NOTIFICATION_NEW_REQUEST_HIRING = "New Client Training Request Notification";
        String content = createNotificationContent_NewRequestHiring(gymerAccount, personalTrainerAccount);

        requestHiringNotification.setContent(content);
        requestHiringNotification.setTitle(TITLE_NOTIFICATION_NEW_REQUEST_HIRING);
        requestHiringNotification.setTimeStamp(LocalDateTime.now());
        requestHiringNotification.setFromAccount(0);
        requestHiringNotification.setToAccount(personalTrainerID);

        notificationRepository.save(requestHiringNotification);
    }

    //-----------------------------------------------------------------------------------------------------------------------------
    // Notification: When Guest created an account and login into system in the first time, the system will send a notification
    public String createNotificationContent_DeclineHiring(Account gymerAccount) {
       StringBuilder stringBuilder = new StringBuilder()
                .append("<p><strong>Dear </strong>").append(gymerAccount.getFullName()).append(",</p>")
                .append("<p>We hope this message finds you well. We wanted to update you regarding your recent training request.</p>")
                .append("<p>After careful consideration, we regret to inform you that the selected personal trainer is currently unavailable and cannot fulfill your request at this time. We understand how important finding the right trainer is, and we apologize for any inconvenience this may cause.</p>")
                .append("<p>We appreciate your understanding and would be more than happy to assist you in finding an alternative personal trainer who can meet your needs. Please feel free to reach out to us for further assistance or to discuss your preferences.</p>")
                .append("<p>Thank you for considering our services, and we look forward to helping you find the perfect trainer for your fitness journey.</p>")
                .append("<p>Best regards,</p>");
        return stringBuilder.toString();
    }

    public void createNotification_DeclineHiring(@RequestParam Integer gymerID,
                                                      @RequestParam Integer personalTrainerID) {
        Account gymerAccount =  accountRepository.findById(gymerID).get();
        Notification requestHiringNotification = new Notification();

        String TITLE_NOTIFICATION_DECLINE_HIRING = "Important Update Regarding Your Training Request";
        String content = createNotificationContent_DeclineHiring(gymerAccount);

        requestHiringNotification.setContent(content);
        requestHiringNotification.setTitle(TITLE_NOTIFICATION_DECLINE_HIRING);
        requestHiringNotification.setTimeStamp(LocalDateTime.now());
        requestHiringNotification.setFromAccount(personalTrainerID);
        requestHiringNotification.setToAccount(gymerID);

        notificationRepository.save(requestHiringNotification);
    }

    //-----------------------------------------------------------------------------------------------------------------------------
    // Notification: When Guest created an account and login into system in the first time, the system will send a notification
    public String createNotificationContent_PaymentSuccess(Account gymerAccount, Account personalTrainerAccount, OrderRequest orderRequest) {
       StringBuilder stringBuilder = new StringBuilder()
                .append("<p><strong>Dear </strong>").append(gymerAccount.getFullName()).append(" and ").append(personalTrainerAccount.getFullName()).append(",</p>")
                .append("<p>We are excited to share that your payment for the upcoming training sessions has been successfully processed.</p>")
                .append("<p><strong>Payment Details:</strong></p>")
                .append("<p>Time of Transaction: ").append(LocalDateTime.now()).append("</p>")
                .append("<p>Amount: ").append(orderRequest.getTotal_of_money()).append("</p>")
                .append("<p>Sender: ").append(gymerAccount.getFullName()).append("</p>")
                .append("<p>This confirms your enrollment in the training program with ").append(personalTrainerAccount.getFullName()).append(". We are looking forward to the journey ahead and the progress you'll achieve together.</p>")
                .append("<p><strong>Training Details:</strong></p>")
                .append("<p>Trainer: ").append(personalTrainerAccount.getFullName()).append("</p>")
                .append("<p>If you have any questions or require further assistance, please do not hesitate to contact us. Wishing you a successful and enjoyable training experience!</p>")
                .append("<p>Best regards,</p>")
                .append("<p>[Your Name or Organization's Name]</p>");
        return stringBuilder.toString();
    }

    public void createNotification_PaymentSuccess(Integer gymerID, Integer personalTrainerID, Integer orderID) {
        Account gymerAccount =  accountRepository.findById(gymerID).get();
        Account personalTrainerAccount = accountRepository.findById(personalTrainerID).get();
        OrderRequest orderRequest = orderRequestRepository.findById(orderID).get();
        Notification paymentSuccessToGymer = new Notification();

        String TITLE_NOTIFICATION_PAYMENT_SUCCESS = "Successful Payment and Course Confirmation";
        String content = createNotificationContent_PaymentSuccess(gymerAccount, personalTrainerAccount, orderRequest);

        paymentSuccessToGymer.setContent(content);
        paymentSuccessToGymer.setTitle(TITLE_NOTIFICATION_PAYMENT_SUCCESS);
        paymentSuccessToGymer.setTimeStamp(LocalDateTime.now());
        paymentSuccessToGymer.setFromAccount(0);
        paymentSuccessToGymer.setToAccount(gymerID);

        notificationRepository.save(paymentSuccessToGymer);
        paymentSuccessToGymer.setToAccount(personalTrainerID);
        notificationRepository.save(paymentSuccessToGymer);
    }
}
