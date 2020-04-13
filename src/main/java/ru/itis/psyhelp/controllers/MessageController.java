package ru.itis.psyhelp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.psyhelp.exceptions.MsgNotFoundException;
import ru.itis.psyhelp.models.*;
import ru.itis.psyhelp.service.MessageService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;


    @GetMapping("/problems")
    public String viewMessagePage(Model model, @AuthenticationPrincipal AccountDetails acc) {
        model.addAttribute("messages", messageService.findAll());
        model.addAttribute("nav_tab", "problems");
        model.addAttribute("acc", acc.getAccount());
        return "problems_topic";
    }

    @PostMapping("/problems")
    public String addMessage(
            @AuthenticationPrincipal AccountDetails user,
            Model model,
            Message message) {
        messageService.createMessage(user.getAccount(), message);
        return "redirect:/problems";
    }

    @GetMapping("/problems/user-list")
    public String userProblems(
            @AuthenticationPrincipal AccountDetails user,
            Model model
    ) {
        model.addAttribute("nav_tab", "my_problems");
        model.addAttribute("messages", messageService.findMessageByUser(user.getAccount()));
        model.addAttribute("acc", user.getAccount());
        return "patient_problems_list";
    }

    @GetMapping("/problems/{id}/delete")
    public String deleteMessage(@PathVariable Long id, @AuthenticationPrincipal AccountDetails account) {
        Message message = messageService.findById(id);
        if (message.getAuthor().getId().equals(account.getAccount().getId())) {
            messageService.deleteMessage(message);
            return "redirect:/problems/user-list";
        }
        return "redirect:/problems";
    }

    @GetMapping("/problems/{id}")
    public String getMessagePage(@PathVariable Long id, Model model) {
        Message message = messageService.findById(id);
        model.addAttribute("message", message);
        List<Comment> comments = message.getComments();
        LocalDateTime publishedAt = message.getPublishedAt();
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm:ss");
        model.addAttribute("comments", comments);
        model.addAttribute("date", publishedAt.format(formatterDate));
        model.addAttribute("time", publishedAt.format(formatterTime));
        model.addAttribute("comCount", comments.size());
        return "message";
    }

    @PostMapping("/problems/{id}")
    public String createComment(@AuthenticationPrincipal AccountDetails acc,
                                @RequestParam("content") String content,
                                @RequestParam(value = "msgId", required = false) Long msgId,
                                Model model,
                                @PathVariable Long id) throws MsgNotFoundException {
        Account account = acc.getAccount();
        Comment comment = messageService.createComment(content, account, id);
        System.out.println(msgId);
        return "redirect:/problems/{id}";
    }
}
