package com.example.selfstudymvcai.controller;

import com.example.selfstudymvcai.dto.ChatGPTRequest;
import com.example.selfstudymvcai.dto.ChatGptResponse;
import com.example.selfstudymvcai.dto.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bot")
public class CustomBotController {

    @Value("${openai.model}")
    private String model;

    @Value(("${openai.api.url}"))
    private String apiURL;

    @Autowired
    private RestTemplate template;

    @GetMapping("/chat")
    public ModelAndView chat(@RequestParam(value="prompt", required=false) String prompt, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Message> chatHistory = (List<Message>) session.getAttribute("chatHistory");
        if (chatHistory == null) {
            chatHistory = new ArrayList<>();
            session.setAttribute("chatHistory", chatHistory);
        }

        if (prompt != null && !prompt.trim().isEmpty()) {
            chatHistory.add(new Message("user", prompt));
            ChatGPTRequest chatGPTRequest = new ChatGPTRequest(model, chatHistory);
            ChatGptResponse chatGptResponse = template.postForObject(apiURL, chatGPTRequest, ChatGptResponse.class);
            Message assistantResponse = chatGptResponse.getChoices().get(0).getMessage();
            // Add the assistant's response to the chat history
            System.out.println(assistantResponse.getContent());
            chatHistory.add(assistantResponse);
        }
        return new ModelAndView("chat", "chatHistory", chatHistory);
    }
}
