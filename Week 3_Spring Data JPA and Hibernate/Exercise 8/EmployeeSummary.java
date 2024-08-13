package com.example.employeemanagementsystem.projection;

import org.springframework.beans.factory.annotation.Value;

public interface EmployeeSummary {
    @Value("#{target.firstName + ' ' + target.lastName}")
    String getFullName();

    String getEmail();

    String getDepartmentName();
}