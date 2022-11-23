package com.example.service;

import com.example.model.Product;

import java.util.List;

public interface ProductService {
    void create(Product product);
    void get(String id) throws Exception;
    void edit(String id, Product product) throws Exception;
    void delete(String id) throws Exception;
    List<Product> searchByName(String name);
    List<Product> findAll();
}
