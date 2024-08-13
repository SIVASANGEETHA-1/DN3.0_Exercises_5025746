package com.example.employeemanagementsystem.projection;

public class EmployeeDetails {
    private final String fullName;
    private final String email;
    private final String departmentName;

    public EmployeeDetails(String fullName, String email, String departmentName) {
        this.fullName = fullName;
        this.email = email;
        this.departmentName = departmentName;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getDepartmentName() {
        return departmentName;
    }
}