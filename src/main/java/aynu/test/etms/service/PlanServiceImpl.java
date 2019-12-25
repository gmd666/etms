package aynu.test.etms.service;

import aynu.test.etms.beans.Plan;
import aynu.test.etms.beans.Task;
import aynu.test.etms.dao.PlanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PlanServiceImpl implements PlanService {
    @Autowired
  private PlanDao planDao;
    @Override
    public List<Plan> findByTid(String tid) {
        return planDao.findByTid(tid);
    }

    @Override
    public Plan findByPid(String pid) {
        return planDao.findByPid(pid);
    }

    @Override
    public List<Task> findByUsername(String username) {
        return planDao.findByUsername(username);
    }

    @Override
    public Boolean updateByPid(Plan plan) {
        return planDao.updateByPid(plan);
    }

    @Override
    public Boolean addPlan(Plan plan) {
        return planDao.addPlan(plan);
    }

    @Override
    public void setTaskState(String tid) {
        planDao.setTaskState(tid);
    }

    @Override
    public void deletePlan(String pid) {
        planDao.deletePlan(pid);
    }

    @Override
    public List<Plan> searchPlan(Plan plan, String pstart2, String pend2) {
        return planDao.searchPlan(plan,pstart2,pend2);
    }

}
