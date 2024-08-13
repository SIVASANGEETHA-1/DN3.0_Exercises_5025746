package com.example.employeemanagementsystem.repository;

import com.example.employeemanagementsystem.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    // Using keywords in method names to create custom query methods
    List<Employee> findByName(String name);

    List<Employee> findByEmail(String email);

    List<Employee> findByDepartment(Department department);

    // Using @Query annotation to create custom query methods
    @Query("SELECT e FROM Employee e WHERE e.name LIKE %?1%")
    List<Employee> findEmployeesByNameLike(String name);

    @Query("SELECT e FROM Employee e WHERE e.email LIKE %?1%")
    List<Employee> findEmployeesByEmailLike(String email);

    // Using @NamedQuery and @NamedQueries to define and execute named queries
    @NamedQuery(name = "Employee.findEmployeesByDepartment", query = "SELECT e FROM Employee e WHERE e.department = ?1")
    List<Employee> findEmployeesByDepartment(Department department);

    @NamedQueries({
            @NamedQuery(name = "Employee.findEmployeesByDepartmentAndName", query = "SELECT e FROM Employee e WHERE e.department = ?1 AND e.name LIKE %?2%"),
            @NamedQuery(name = "Employee.findEmployeesByDepartmentAndEmail", query = "SELECT e FROM Employee e WHERE e.department = ?1 AND e.email LIKE %?2%")
    })
    List<Employee> findEmployeesByDepartmentAndName(Department department, String name);

    List<Employee> findEmployeesByDepartmentAndEmail(Department department, String email);
}