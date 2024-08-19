package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Book;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    private List<Book> books = new ArrayList<>();

    {
        books.add(new Book(1L, "Book 1", "Author 1", 20.0, "1234567890"));
        books.add(new Book(2L, "Book 2", "Author 2", 30.0, "2345678901"));
        books.add(new Book(3L, "Book 3", "Author 3", 40.0, "3456789012"));
    }

    // 1. Response Status: Customize HTTP status codes for your endpoints
    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Book> getBookById(@PathVariable Long id) {
        Optional<Book> bookOptional = books.stream().filter(book -> book.getId().equals(id)).findFirst();
        return bookOptional.map(book -> new ResponseEntity<>(book, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // 2. Custom Headers: Add custom headers to the response using ResponseEntity
    @GetMapping
    public ResponseEntity<List<Book>> getAllBooks() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", String.valueOf(books.size()));
        headers.add("X-Book-Source", "Bookstore API");
        return new ResponseEntity<>(books, headers, HttpStatus.OK);
    }
}