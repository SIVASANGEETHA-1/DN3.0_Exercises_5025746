package com.example.BookstoreAPI.mapper;

import com.example.BookstoreAPI.dto.CustomerDTO;
import com.example.BookstoreAPI.entity.Customer;
import org.modelmapper.ModelMapper;

public class CustomerMapper {
    private static ModelMapper modelMapper = new ModelMapper();

    public static CustomerDTO customerToCustomerDTO(Customer customer) {
        return modelMapper.map(customer, CustomerDTO.class);
    }

    public static Customer customerDTOToCustomer(CustomerDTO customerDTO) {
        return modelMapper.map(customerDTO, Customer.class);
    }
}