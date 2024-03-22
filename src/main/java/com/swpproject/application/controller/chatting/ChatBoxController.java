package com.swpproject.application.controller.chatting;

import com.swpproject.application.dto.ChatBoxDTO;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.ChatBox;
import com.swpproject.application.model.Message;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.ChatBoxRepository;
import com.swpproject.application.repository.MessageRepository;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.PersonalTrainerService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ChatBoxController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private ChatBoxRepository chatBoxRepository;
    @Autowired
    private MessageRepository messageRepository;
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/chatting", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String chatting() {
        return "chatting/chatting";
    }

    @ResponseBody
    @RequestMapping(value = "/create-new-chat-box", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public ResponseEntity<Void> createNewChatBoxWithPT(@RequestParam Integer receiverID, @RequestParam String firstMessageContent, HttpSession session) {
        Account userAccount = (Account) session.getAttribute("account");
        Account ptAccount = personalTrainerService.findPersonalTrainerByID(receiverID).get().getAccount();

        Integer userAccountID = userAccount.getId();
        List<ChatBox> chatBoxes = chatBoxRepository.findAll().stream()
                .filter(box -> box.getAccount_2().getId().equals(userAccountID) && box.getAccount_1().getId().equals(ptAccount.getId())
                        || box.getAccount_1().getId().equals(userAccountID) && box.getAccount_2().getId().equals(ptAccount.getId()))
                .collect(Collectors.toList());

        if (chatBoxes.isEmpty()) {
            ChatBox chatBox = new ChatBox();
            chatBox.setAccount_1(userAccount);
            chatBox.setAccount_2(accountRepository.findById(ptAccount.getId()).get());
            chatBox.setLastMessage(null);
            chatBoxRepository.save(chatBox);

            Message firstMessage = new Message();
            chatBox = chatBoxRepository.findAll().getLast();
            firstMessage.setSenderAccount(userAccount);
            firstMessage.setChatBox(chatBox);
            firstMessage.setContent(firstMessageContent);
            firstMessage.setTimeStamp(LocalDateTime.now());
            messageRepository.save(firstMessage);
            chatBox.setLastMessage(messageRepository.findAll().getLast());
            chatBoxRepository.save(chatBox);
        }
        return ResponseEntity.ok().build();
    }

    @ResponseBody
    @GetMapping(value = "/View-box-chat-list")
    public ResponseEntity<List<ChatBoxDTO>> viewBoxChatList(@RequestParam String username, HttpSession session) {
        List<ChatBoxDTO> chatBoxDTOs = new ArrayList<>();
        Account account = (Account) session.getAttribute("account");
        List<ChatBox> chatBoxes = chatBoxRepository.findAll().stream()
                .filter(chatBox -> chatBox.getAccount_1().getId().equals(account.getId())
                        || chatBox.getAccount_2().getId().equals(account.getId()))
                .collect(Collectors.toList());

        String finalUsername = username.toLowerCase();
        List<ChatBox> chatBoxesFilter = chatBoxes.stream().filter(chatBox -> chatBox.getAccount_1().getId().equals(account.getId())
                && chatBox.getAccount_2().getFullName().toLowerCase().contains(finalUsername)
                || chatBox.getAccount_2().getId().equals(account.getId())
                && chatBox.getAccount_1().getFullName().toLowerCase().contains(finalUsername)).collect(Collectors.toList());
        Collections.sort(chatBoxesFilter, new Comparator<ChatBox>() {
            @Override
            public int compare(ChatBox chatBox1, ChatBox chatBox2) {
                LocalDateTime timeStamp1 = chatBox1.getLastMessage() != null ? chatBox1.getLastMessage().getTimeStamp() : LocalDateTime.MIN;
                LocalDateTime timeStamp2 = chatBox2.getLastMessage() != null ? chatBox2.getLastMessage().getTimeStamp() : LocalDateTime.MIN;
                return timeStamp2.compareTo(timeStamp1);
            }
        });

        for (ChatBox chatBox : chatBoxesFilter) {
            ChatBoxDTO newDTO = new ChatBoxDTO();
            newDTO.setId(chatBox.getId());
            newDTO.setLastContent(chatBox.getLastMessage().getContent());
            newDTO.setLastTimeStamp(chatBox.getLastMessage().getTimeStamp());
            if (chatBox.getAccount_1().getId().equals(account.getId())) {
                newDTO.setAvatarSender(chatBox.getAccount_2().getAvatarImageAsString());
                newDTO.setNameSender(chatBox.getAccount_2().getFullName());
            } else {
                newDTO.setAvatarSender(chatBox.getAccount_1().getAvatarImageAsString());
                newDTO.setNameSender(chatBox.getAccount_1().getFullName());
            }
            chatBoxDTOs.add(newDTO);
        }
        return ResponseEntity.ok().body(chatBoxDTOs);
    }
}
