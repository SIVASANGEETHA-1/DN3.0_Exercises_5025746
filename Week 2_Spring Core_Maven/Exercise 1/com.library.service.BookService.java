package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void addBook(String title, String author) {
        // TO DO: implement book addition logic
        System.out.println("Book added: " + title + " by " + author);
    }
}