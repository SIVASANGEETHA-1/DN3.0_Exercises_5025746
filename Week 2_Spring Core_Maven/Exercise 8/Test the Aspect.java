package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApp {

    public static void main(String[] args) {
        // Load the Spring context
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Get the BookService bean
        BookService bookService = context.getBean(BookService.class);

        // Test the AOP functionality
        bookService.addBook("Book1");
        bookService.updateBook("Book2");
        bookService.deleteBook("Book3");
    }
}