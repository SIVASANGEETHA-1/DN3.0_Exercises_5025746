package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.entity.Book;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/books")
public class BookController {

    private List<Book> books = new ArrayList<>();

    {
        books.add(new Book(1L, "Book 1", "Author 1", 20.0, "1234567890"));
        books.add(new Book(2L, "Book 2", "Author 2", 30.0, "2345678901"));
        books.add(new Book(3L, "Book 3", "Author 3", 40.0, "3456789012"));
    }

    // 1. Path Variables: Fetch a book by its ID using a path variable
    @GetMapping("/{id}")
    public ResponseEntity<Book> getBookById(@PathVariable Long id) {
        Optional<Book> bookOptional = books.stream().filter(book -> book.getId().equals(id)).findFirst();
        return bookOptional.map(book -> new ResponseEntity<>(book, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // 2. Query Parameters: Filter books based on query parameters like title and author
    @GetMapping
    public ResponseEntity<List<Book>> getBooksByTitleAndAuthor(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String author) {
        List<Book> filteredBooks = new ArrayList<>();
        for (Book book : books) {
            if ((title == null || book.getTitle().contains(title)) &&
                    (author == null || book.getAuthor().contains(author))) {
                filteredBooks.add(book);
            }
        }
        return new ResponseEntity<>(filteredBooks, HttpStatus.OK);
    }
}