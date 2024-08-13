package com.example.employeemanagementsystem.repository;

import com.example.employeemanagementsystem.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSortUnmapper;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.FluentJpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>, FluentJpaRepository<Employee, Long> {

    @Query("SELECT e FROM Employee e")
    List<Employee> findAllByCustomQuery();

    @Query("SELECT e FROM Employee e")
    List<Employee> findAllByCustomQuery(Sort sort);
}