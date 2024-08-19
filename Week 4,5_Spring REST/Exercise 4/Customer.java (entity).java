package com.example.BookstoreAPI.entity;

import lombok.Data;

@Data
public class Customer {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
}