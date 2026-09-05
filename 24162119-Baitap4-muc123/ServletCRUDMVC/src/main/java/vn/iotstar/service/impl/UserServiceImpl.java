package vn.iotstar.service.impl;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByPhone(String phone) {
        return userDao.findByPhone(phone);
    }

    @Override
    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public User findByCode(String code) {
        return userDao.findByCode(code);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }
}