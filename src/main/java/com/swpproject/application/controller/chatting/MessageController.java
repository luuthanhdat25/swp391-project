package com.swpproject.application.controller.chatting;

import com.swpproject.application.dto.MessageDTO;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.ChatBox;
import com.swpproject.application.model.Message;
import com.swpproject.application.repository.ChatBoxRepository;
import com.swpproject.application.repository.MessageRepository;
import com.swpproject.application.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MessageController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private ChatBoxRepository chatBoxRepository;
    @Autowired
    private MessageRepository messageRepository;

    @ResponseBody
    @RequestMapping(value = "/create-new-message", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public ResponseEntity<Void> createNewMessage(@RequestParam Integer chatBoxId, @RequestParam String content, HttpSession session) {
        Account senderAccount = (Account) session.getAttribute("account");
        ChatBox chatBox = chatBoxRepository.findById(chatBoxId).get();
        Message newMessage = new Message();

        newMessage.setChatBox(chatBox);
        newMessage.setContent(content);
        newMessage.setSenderAccount(senderAccount);
        newMessage.setTimeStamp(LocalDateTime.now());
        messageRepository.save(newMessage);
        chatBox.setLastMessage(messageRepository.findAll().getLast());
        chatBoxRepository.save(chatBox);
        return ResponseEntity.ok().build();
    }

    @ResponseBody
    @GetMapping(value = "/View-message-list")
    public ResponseEntity<List<MessageDTO>> viewMessageList(@RequestParam Integer chatBoxID, HttpSession session) {
        List<MessageDTO> messageDTOs = new ArrayList<>();
        List<Message> messages = messageRepository.findAll().stream()
                .filter(message -> message.getChatBox().getId().equals(chatBoxID))
                .collect(Collectors.toList());

        Account currentAccount = (Account) session.getAttribute("account");
        Integer currentAccountID = currentAccount.getId();

        for (Message message : messages) {
            MessageDTO newDTO = new MessageDTO();
            newDTO.setSenderImage(message.getSenderAccount().getAvatarImageAsString());
            newDTO.setSenderName(message.getSenderAccount().getFullName());
            newDTO.setTimeStamp(message.getTimeStamp());
            newDTO.setContent(message.getContent());
            if (currentAccountID.equals(message.getSenderAccount().getId())) newDTO.setIsCurrentUserMessage(1);
            else newDTO.setIsCurrentUserMessage(0);
            messageDTOs.add(newDTO);
            System.out.println(newDTO.getIsCurrentUserMessage());
        }
        return ResponseEntity.ok().body(messageDTOs);
    }
}
