package com.example.demo.controller;


import com.example.demo.entity.ResetPass;
import com.example.demo.entity.User;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.form.FormConfirm;
import com.example.demo.form.RegisterForm;
import com.example.demo.form.ResetForm;
import com.example.demo.repositories.ResetPassRepo;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Optional;
import java.util.UUID;


@Controller
@RequiredArgsConstructor
@RequestMapping
public class UserController {
    private final UserService userService;
    private final ResetPassRepo resetPassRepository;
    private final PasswordEncoder passwordEncoder;
    private Long tokenId;


    @GetMapping("/user/register")
    public String addUser(Model model) {
        if (!model.containsAttribute("form")) {
            model.addAttribute("form", new RegisterForm());
        }
        return "register";
    }

    @PostMapping("/user/register")
    public String registerNewUser(@Valid RegisterForm form, BindingResult bindingResult) throws BindException {

        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        userService.register(form);
        return "redirect:/user/login";
    }

    @GetMapping("/user/login")
    public String loginPage(@RequestParam(required = false, defaultValue = "false") Boolean error, Model model) {
        model.addAttribute("error", error);
        return "login";
    }



    @GetMapping("/user/profile")
    public String pageCustomerProfile(Model model, Principal principal) {
        var user = userService.getByEmail(principal.getName());
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/forgotpass")
    public String pageForgoTPass(Model model) {
        if (!model.containsAttribute("form")) {
            model.addAttribute("form", new ResetForm());
        }
        return "forgot";
    }

    @PostMapping("/forgot")
    public String SendEmailWithPass(@Valid ResetForm form, BindingResult bindingResult) throws BindException {
        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        if (!userService.existByEmail(form.getEmail())) {
            throw new ResourceNotFoundException("There is no user with such email" + form.getEmail());
        }

        sendEmail(form.getEmail());
        return "redirect:/check-forgot-pass";

    }

    private void sendEmail(String email) {
        ResetPass token = new ResetPass(UUID.randomUUID().toString(), userService.getByEmail(email));
        resetPassRepository.save(token);
        tokenId = token.getId();
    }

    @GetMapping("/check-forgot-pass")
    public String checkForgotPass(Model model) {
        Optional<ResetPass> resetPass = resetPassRepository.findById(tokenId);
        if (resetPass.get() == null) {
            model.addAttribute("tok", null);
        } else {
            model.addAttribute("tok", resetPass.get());
        }

        model.addAttribute("form", new FormConfirm());

        return "check-forgot-pass";
    }


    @PostMapping("/changePass")
    public String changePass(@Valid FormConfirm form, BindingResult bindingResult) throws BindException {
        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        if (!userService.existByEmail(form.getEmail())) {
            throw new UserNotFoundException();
        }
        User user = userService.getByEmail(form.getEmail());
        if (!resetPassRepository.existsByTokenAndUser(form.getToken(), user)) {
            throw new ResourceNotFoundException("There is no such user or token");
        }
        user.setPassword(passwordEncoder.encode(form.getPassword()));
        userService.save(user);
        return "redirect:/user/login";
    }}
