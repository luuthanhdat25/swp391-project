package com.swpproject.application.controller.notification;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GroupNotificationList {
    private int groupNumber;
    private List<String> imageDatas = new ArrayList<>();
    private String title;
    private String content;
    private LocalDateTime timeStamp;

    public void addImageData(String imageData) {
        imageDatas.add(imageData);
    }
}
