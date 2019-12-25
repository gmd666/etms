package aynu.test.etms.dao;

import aynu.test.etms.beans.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskDao {
    void addTask(Task task);

    List<Task> taskSelect(String mid);

    Task findByTid(String tid);

    List<Task> findTask(String mid);

    Boolean editState(@Param("tid") String tid, @Param("tstate") String tstate);

    List<Task> findUntask(String mid);

    void updateTask(Task task);
}
