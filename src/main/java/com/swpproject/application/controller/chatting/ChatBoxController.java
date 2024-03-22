package com.swpproject.application.controller.chatting;

import com.swpproject.application.dto.ChatBoxDTO;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.ChatBox;
import com.swpproject.application.model.Message;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.ChatBoxRepository;
import com.swpproject.application.repository.MessageRepository;
import com.swpproject.application.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ChatBoxController {
    @Autowired private AccountService accountService;
    @Autowired private AccountRepository accountRepository;
    @Autowired private ChatBoxRepository chatBoxRepository;
    @Autowired private MessageRepository messageRepository;

    @RequestMapping(value = "/create-new-chat-box", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createNewChatBox(@RequestParam Integer receiverID, HttpSession session) {
        Account userAccount = (Account) session.getAttribute("account");
        Integer userAccountID = userAccount.getId();
        ChatBox chatBox = chatBoxRepository.findAll().stream()
                .filter(box -> box.getAccount_2().getId().equals(userAccountID) && box.getAccount_1().getId().equals(receiverID)
                || box.getAccount_1().getId().equals(userAccountID) && box.getAccount_2().getId().equals(receiverID))
                .collect(Collectors.toList()).get(0);

        if (chatBox == null) {
            chatBox = new ChatBox();
            chatBox.setAccount_1(userAccount);
            chatBox.setAccount_2(accountRepository.findById(receiverID).get());
            chatBox.setLastMessage(null);
            chatBoxRepository.save(chatBox);
        }
        return "redirect: chatting";
    }

    @ResponseBody
    @GetMapping(value = "/View-box-chat-list")
    public ResponseEntity<List<ChatBoxDTO>> viewBoxChatList(HttpSession session) {
        List<ChatBoxDTO> chatBoxDTOs = new ArrayList<>();
        Account account = (Account) session.getAttribute("account");
        List<ChatBox> chatBoxes = chatBoxRepository.findAll().stream()
                .filter(chatBox -> chatBox.getAccount_1().getId().equals(account.getId())
                || chatBox.getAccount_2().getId().equals(account.getId()))
                .collect(Collectors.toList());

        for (ChatBox chatBox : chatBoxes) {
            ChatBoxDTO newDTO = new ChatBoxDTO();
            newDTO.setId(chatBox.getId());
            newDTO.setLastContent(chatBox.getLastMessage().getContent());
            newDTO.setLastTimeStamp(chatBox.getLastMessage().getTimeStamp());
            if (chatBox.getAccount_1().getId().equals(account.getId())) {
                newDTO.setAvatarSender(chatBox.getAccount_2().getAvatarImageAsString());
                newDTO.setNameSender(chatBox.getAccount_2().getFullName());
            }
            else {
                newDTO.setAvatarSender(chatBox.getAccount_1().getAvatarImageAsString());
                newDTO.setNameSender(chatBox.getAccount_1().getFullName());
            }
            chatBoxDTOs.add(newDTO);
        }
        return ResponseEntity.ok().body(chatBoxDTOs);
    }
}
