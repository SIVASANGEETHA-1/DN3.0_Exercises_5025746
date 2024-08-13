package com.example.employeemanagementsystem.controller;

import com.example.employeemanagementsystem.entity.Employee;
import com.example.employeemanagementsystem.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping
    public ResponseEntity<Page<Employee>> getAllEmployees(@RequestParam(defaultValue = "0") int page,
                                                          @RequestParam(defaultValue = "10") int size,
                                                          @RequestParam(defaultValue = "id,asc") String[] sort) {
        Pageable pageable = Pageable.ofSize(size).withPage(page);
        Sort sortParams = Sort.by(sort[0]).ascending();
        if (sort[1].equals("desc")) {
            sortParams = Sort.by(sort[0]).descending();
        }
        Page<Employee> employees = employeeRepository.findAll(pageable.withSort(sortParams));
        return new ResponseEntity<>(employees, HttpStatus.OK);
    }
}