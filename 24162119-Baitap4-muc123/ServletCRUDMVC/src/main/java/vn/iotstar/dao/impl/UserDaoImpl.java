package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JpaConfig;
import vn.iotstar.dao.UserDao;
import vn.iotstar.model.User;

public class UserDaoImpl implements UserDao {

    @Override
    public User findByUsername(String username) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE TRIM(u.userName) = :username";
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("username", username.trim());

            List<User> list = query.getResultList();
            if (!list.isEmpty()) {
                return list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            enma.close();
        }
        return null;
    }

    @Override
    public User findByPhone(String phone) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE TRIM(u.phone) = :phone";
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("phone", phone.trim());

            List<User> list = query.getResultList();
            if (!list.isEmpty()) {
                return list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            enma.close();
        }
        return null;
    }

    @Override
    public User login(String username, String password) {
        User user = this.findByUsername(username);
        if (user != null && user.getPassWord() != null) {
            if (user.getPassWord().trim().equals(password.trim())) {
                return user;
            }
        }
        return null;
    }

    @Override
    public void insert(User user) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            enma.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE TRIM(u.email) = :email";
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("email", email.trim());

            List<User> list = query.getResultList();
            if (!list.isEmpty()) {
                return list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            enma.close();
        }
        return null;
    }

    @Override
    public User findByCode(String code) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE TRIM(u.code) = :code AND u.status = 0";
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("code", code.trim());

            List<User> list = query.getResultList();
            if (!list.isEmpty()) {
                return list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            enma.close();
        }
        return null;
    }

    @Override
    public void update(User user) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            enma.close();
        }
    }

    @Override
    public User findById(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            return enma.find(User.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            enma.close();
        }
        return null;
    }
}