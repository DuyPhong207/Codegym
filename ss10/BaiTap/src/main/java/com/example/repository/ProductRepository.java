package com.example.repository;

import com.example.model.Product;

import java.util.List;

public interface ProductRepository {
    void create(Product product);
    void get(int index);
    void edit(int index, Product product);
    int getIndex(Product product);
    void delete(Product product);
    List<Product> searchByName(String name);
    List<Product> findAll();
}
