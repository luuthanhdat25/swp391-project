package com.swpproject.application.utils;

import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class SessionUtils {

    public static void removeAttributes(HttpSession session, String ... attributes) {
        for(String attribute:attributes) {
            session.removeAttribute(attribute);
        }
    }

}
