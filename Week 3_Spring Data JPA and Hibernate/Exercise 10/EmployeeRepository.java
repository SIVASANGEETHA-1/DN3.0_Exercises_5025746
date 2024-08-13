package com.example.employeemanagementsystem.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeRepository {
    private final SessionFactory sessionFactory;

    @Autowired
    public EmployeeRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void batchSaveEmployees(List<Employee> employees) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        int batchSize = 20;
        for (int i = 0; i < employees.size(); i++) {
            session.save(employees.get(i));
            if ((i + 1) % batchSize == 0) {
                session.flush();
                session.clear();
            }
        }

        session.getTransaction().commit();
    }
}