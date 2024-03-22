package com.swpproject.application.controller.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChattingController {
    @RequestMapping(value = "/chatting", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String chatting() {
        return "chatting/chatting";
    }
}
