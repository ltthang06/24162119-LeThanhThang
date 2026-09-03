package vn.iotstar.service;

import vn.iotstar.model.User;

public interface UserService {
    User findByUsername(String username);
    User findByPhone(String phone);
    User login(String username, String password);
    void insert(User user);

    User findByEmail(String email);
    User findByCode(String code);
    void update(User user);
    
    User findById(int id);
}