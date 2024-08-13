package com.example.employeemanagementsystem.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentRepository {
    private final JdbcTemplate jdbcTemplate;

    public DepartmentRepository(@Qualifier("secondaryDataSource") DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // Repository methods
}