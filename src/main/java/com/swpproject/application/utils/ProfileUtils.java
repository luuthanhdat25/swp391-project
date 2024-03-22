package com.swpproject.application.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.Duration;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ProfileUtils {

    private static final int MIN_LENGTH_PASS = 8;
    private static final int MAX_LENGTH_PASS = 20;
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[\\w!#$%&amp;'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&amp;'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$");

    private static final String REGEX_NAME = "^[a-zA-Z ]+$";

    private static final LocalDate CURRENT_DATE = LocalDate.now();

    public static Boolean isValidName(String name) {
        return name.matches(REGEX_NAME);
    }

    public static Boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).matches();
    }

    public static Boolean isValidPasword(String password) {
        return ((password.length() >= MIN_LENGTH_PASS) && (password.length() <= MAX_LENGTH_PASS));
    }

    public static Boolean isValidBirthday(LocalDate birthday) {
        return birthday.isBefore(CURRENT_DATE);
    }

    public static Boolean isPasswordMatches(String password, String repeat) {
        return password.equals(repeat);
    }




}
