package com.example.demo.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

import static java.util.stream.Collectors.toList;


@ControllerAdvice(annotations = Controller.class)
public class BindExceptionHandler {

    @ExceptionHandler(BindException.class)
    protected ResponseEntity<Object> handleBindException(BindException ex) {
        var bindingResult = ex.getBindingResult();

        var apiFieldErrors = bindingResult
                .getFieldErrors()
                .stream()
                .map(fe -> String.format("%s -> %s", fe.getField(), fe.getDefaultMessage()))
                .collect(toList());

        return ResponseEntity.unprocessableEntity()
                .body(apiFieldErrors);
    }

    @ResponseBody
    @ExceptionHandler(IOException.class)
    protected String handleFileNotFoundEx() {
        return "file not found";
    }

    @ResponseBody
    @ExceptionHandler(ResourceNotFoundException.class)
    protected String resourceNotFoundException(ResourceNotFoundException ex) {
        return ex.getMessage();
    }

    @ResponseBody
    @ExceptionHandler(RuntimeException.class)
    protected String runtimeEx(RuntimeException ex) {
        return ex.getMessage();
    }
}
