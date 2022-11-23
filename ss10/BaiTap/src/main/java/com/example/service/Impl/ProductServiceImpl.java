package com.example.service.Impl;

import com.example.model.Product;
import com.example.repository.Impl.ProductRepositoryImpl;
import com.example.repository.ProductRepository;
import com.example.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRepository repository = new ProductRepositoryImpl();

    @Override
    public void create(Product product) {
        repository.create(product);
    }

    @Override
    public void get(String id) throws Exception {
        int index = repository.getIndex(new Product(id));
        if (index == -1) {
            throw new Exception("Not found");
        } else {
            repository.get(index);
        }
    }

    @Override
    public void edit(String id, Product product) throws Exception {
        int index = repository.getIndex(new Product(id));
        if (index == -1) {
            throw new Exception("Not Found");
        } else {
            repository.edit(index, product);
        }
    }

    @Override
    public void delete(String id) throws Exception {
        int index = repository.getIndex(new Product(id));
        if (index == -1) {
            throw new Exception("Not found");
        } else {
            repository.delete(new Product(id));
        }
    }

    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }
}
