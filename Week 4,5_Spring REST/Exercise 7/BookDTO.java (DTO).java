package com.example.BookstoreAPI.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class BookDTO {
    private Long id;
    private String title;
    private String author;
    @JsonProperty("price_in_dollars")
    private Double price;
    private String isbn;
}