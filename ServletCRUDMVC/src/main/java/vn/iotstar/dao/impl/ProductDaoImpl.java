package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import vn.iotstar.configs.JpaConfig;
import vn.iotstar.dao.ProductDao;
import vn.iotstar.model.Product;

public class ProductDaoImpl implements ProductDao {

    @Override
    public List<Product> findAll() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            TypedQuery<Product> query = enma.createNamedQuery("Product.findAll", Product.class);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public Product findById(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            return enma.find(Product.class, id);
        } finally {
            enma.close();
        }
    }

    @Override
    public void insert(Product product) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(product);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Product product) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(product);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Product product = enma.find(Product.class, id);
            if (product != null) {
                enma.remove(product);
            }
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> findTop10() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setFirstResult(0);
            query.setMaxResults(10);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public int count() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(p) FROM Product p";
            Query query = enma.createQuery(jpql);
            return ((Long) query.getSingleResult()).intValue();
        } finally {
            enma.close();
        }
    }
}