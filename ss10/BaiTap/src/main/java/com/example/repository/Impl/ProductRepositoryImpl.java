package com.example.repository.Impl;

import com.example.model.Product;
import com.example.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> productList;
    static {
        productList = new ArrayList<>();
        productList.add(new Product("001", "iphone", 2500000, "ip13"));
        productList.add(new Product("002", "iphone", 1500000, "ip12"));
        productList.add(new Product("003", "sam sung", 2500000, "note 13"));
        productList.add(new Product("004", "sam sung", 500000, "galaxy y"));
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public void get(int index) {
        productList.get(index);
    }

    @Override
    public void edit(int index, Product product) {
        productList.set(index, product);
    }

    @Override
    public int getIndex(Product product) {
        return productList.indexOf(product);
    }

    @Override
    public void delete(Product product) {
        productList.remove(product);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> listSearchByName = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName() == name) {
                listSearchByName.add(product);
            }
        }
        return listSearchByName;
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }
}
