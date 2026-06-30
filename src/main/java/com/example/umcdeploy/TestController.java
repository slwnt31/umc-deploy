package com.example.umcdeploy;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public String home() {
        return "GCP 배포 성공 완료! 🚀 (JDK 21)";
    }
}