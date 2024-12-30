package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOrderConfirmationEmail(String to, String name, String address, String tel, double total) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("myshop@gmail.com");
        message.setTo(to);
        message.setSubject("Order Confirmation");

        String emailText = String.format(
                "Dear %s,\n\n" +
                        "Thank you for your order!\n\n" +
                        "Order Details:\n" +
                        "Name: %s\n" +
                        "Address: %s\n" +
                        "Phone: %s\n" +
                        "Total Amount: %.2f Som\n\n" +
                        "We will process your order shortly.\n\n" +
                        "Best regards,\n" +
                        "MYSHOP.kg",
                name, name, address, tel, total
        );

        message.setText(emailText);

        mailSender.send(message);
    }
}