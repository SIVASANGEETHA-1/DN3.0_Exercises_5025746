package com.example.employeemanagementsystem.repository;

import com.example.employeemanagementsystem.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

    // Using keywords in method names to create custom query methods
    Department findByName(String name);

    // Using @Query annotation to create custom query methods
    @Query("SELECT d FROM Department d WHERE d.name LIKE %?1%")
    List<Department> findDepartmentsByNameLike(String name);
}