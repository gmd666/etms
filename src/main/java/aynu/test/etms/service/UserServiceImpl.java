package aynu.test.etms.service;

import aynu.test.etms.beans.User;
import aynu.test.etms.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User findUserByLogin(String username, String password) {
        return userDao.findUserByLogin(username,password);
    }

    @Override
    public int getCount() {
        return userDao.getCount();
    }

    @Override
    public Boolean addEmployee(User user) {
        return userDao.addEmployee(user);
    }

    @Override
    public Boolean findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public List<User> userSelect() {
        return userDao.userSelect();
    }

    @Override
    public User findById(String id) {
        return userDao.findById(id);
    }

    @Override
    public void deleteById(String id) {
        userDao.deleteById(id);
    }

    @Override
    public List<User> allotUser() {
        return userDao.allotUser();
    }

    @Override
    public List<User> getBoss() {
        return userDao.getBoss();
    }

    @Override
    public void allotBoss(String eid, String bid, String bname) {
        userDao.allotBoss(eid,bid,bname);
    }

    @Override
    public List<User> dataReturn() {
        return userDao.dataReturn();
    }

    @Override
    public Boolean returnById(String id) {
        return userDao.returnById(id);
    }

    @Override
    public List<User> finByBid(String bid) {
        return userDao.findByBid(bid);
    }

    @Override
    public User findByEid(String eid) {
        return userDao.findByEid(eid);
    }
}
