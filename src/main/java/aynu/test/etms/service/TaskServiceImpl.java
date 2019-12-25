package aynu.test.etms.service;

import aynu.test.etms.beans.Task;
import aynu.test.etms.dao.TaskDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TaskServiceImpl implements TaskService{
    @Autowired
    private TaskDao taskDao;

    @Override
    public void addTask(Task task) {
        taskDao.addTask(task);
    }

    @Override
    public List<Task> taskSelect(String mid) {
        return taskDao.taskSelect(mid);
    }

    @Override
    public Task findByTid(String tid) {
        return taskDao.findByTid(tid);
    }

    @Override
    public List<Task> findTask(String mid) {
        return taskDao.findTask(mid);
    }

    @Override
    public Boolean editState(String tid, String tstate) {
        return taskDao.editState(tid,tstate);
    }

    @Override
    public List<Task> findUntask(String mid) {
        return taskDao.findUntask(mid);
    }

    @Override
    public void updateTask(Task task) {
        taskDao.updateTask(task);
    }
}
