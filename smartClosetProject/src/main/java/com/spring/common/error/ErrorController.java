package com.spring.common.error;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/error/*")
@Log4j
@AllArgsConstructor

@RestController
public class ErrorController {
    @GetMapping("/internalerror")
    public void internalerror() {
        throw new RuntimeException("500 Internal Error !!");
    }

}