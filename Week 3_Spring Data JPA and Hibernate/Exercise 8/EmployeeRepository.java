package com.example.employeemanagementsystem.repository;

import com.example.employeemanagementsystem.entity.Employee;
import com.example.employeemanagementsystem.projection.EmployeeDetails;
import com.example.employeemanagementsystem.projection.EmployeeSummary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    @Query("SELECT e FROM Employee e WHERE e.department.id = :departmentId")
    List<EmployeeSummary> findEmployeeSummariesByDepartmentId(@Param("departmentId") Long departmentId);

    @Query("SELECT new com.example.employeemanagementsystem.projection.EmployeeDetails(e.firstName + ' ' + e.lastName, e.email, e.department.name) " +
            "FROM Employee e WHERE e.department.id = :departmentId")
    List<EmployeeDetails> findEmployeeDetailsByDepartmentId(@Param("departmentId") Long departmentId);
}