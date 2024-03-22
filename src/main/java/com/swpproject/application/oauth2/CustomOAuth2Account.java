//package com.swpproject.application.oauth2;
//
//import lombok.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Component;
//
//import java.util.Collection;
//import java.util.Map;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Getter
//@Setter
//@Builder
//public class CustomOAuth2Account implements OAuth2User {
//
//    private OAuth2User oAuth2User;
//
//    @Override
//    public <A> A getAttribute(String name) {
//        return OAuth2User.super.getAttribute(name);
//    }
//
//    @Override
//    public Map<String, Object> getAttributes() {
//        return oAuth2User.getAttributes();
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return oAuth2User.getAuthorities();
//    }
//
//    @Override
//    public String getName() {
//        return oAuth2User.getAttribute("name");
//    }
//
//    public String getEmail() {
//        return oAuth2User.<String>getAttribute("email");
//    }
//}
