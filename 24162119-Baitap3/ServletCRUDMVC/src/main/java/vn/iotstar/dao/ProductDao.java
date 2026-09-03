package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.model.Product;

public interface ProductDao {
    List<Product> findAll();
    Product findById(int id);
    void insert(Product product);
    void update(Product product);
    void delete(int id);

    List<Product> findTop10();
    List<Product> findAll(int page, int pageSize);
    int count();
}