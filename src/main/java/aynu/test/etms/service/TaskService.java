package aynu.test.etms.service;

import aynu.test.etms.beans.Task;

import java.util.List;

public interface TaskService {

    void addTask(Task task);

    List<Task> taskSelect(String mid);

    Task findByTid(String tid);

    List<Task> findTask(String mid);

    Boolean editState(String tid, String tstate);

    List<Task> findUntask(String mid);

    void updateTask(Task task);
}
