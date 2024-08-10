package com.library.service;

import com.library.repository.BookRepository;

public class BookServiceImpl implements BookService {

    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Other methods...
}