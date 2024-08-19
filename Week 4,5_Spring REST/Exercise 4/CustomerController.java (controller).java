package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Customer;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    private List<Customer> customers = new ArrayList<>();

    // 1. Request Body: Create a new customer by accepting a JSON request body
    @PostMapping
    public ResponseEntity<Customer> createCustomer(@RequestBody Customer customer) {
        customers.add(customer);
        return new ResponseEntity<>(customer, HttpStatus.CREATED);
    }

    // 2. Form Data: Process form data for customer registrations
    @PostMapping("/register")
    public ResponseEntity<Customer> registerCustomer(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam String password) {
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setEmail(email);
        customer.setPassword(password);
        customers.add(customer);
        return new ResponseEntity<>(customer, HttpStatus.CREATED);
    }
}