package aynu.test.etms.dao;

import aynu.test.etms.beans.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User findUserByLogin(@Param("username") String username, @Param("password") String password);

    int getCount();

    Boolean addEmployee(User user);

    Boolean findByUserName(String username);

    List<User> userSelect();

    User findById(String id);

    void deleteById(String id);

    List<User> allotUser();

    List<User> getBoss();

    void allotBoss(@Param("eid") String eid, @Param("bid") String bid, @Param("bname") String bname);

    List<User> dataReturn();

    Boolean returnById(String id);

    List<User> findByBid(String bid);

    User findByEid(String eid);
}
