package aynu.test.etms.service;

import aynu.test.etms.beans.User;

import java.util.List;

public interface UserService {
    User findUserByLogin(String username, String password);

    int getCount();

    Boolean addEmployee(User user);

    Boolean findByUserName(String username);

    List<User> userSelect();

    User findById(String id);

    void deleteById(String id);

    List<User> allotUser();

    List<User> getBoss();

    void allotBoss(String eid, String bid, String bname);

    List<User> dataReturn();

    Boolean returnById(String id);

    List<User> finByBid(String bid);

    User findByEid(String eid);
}
