package aynu.test.etms.service;

import aynu.test.etms.beans.Plan;
import aynu.test.etms.beans.Task;

import java.util.List;

public interface PlanService {
    List<Plan> findByTid(String tid);

    Plan findByPid(String pid);

    List<Task> findByUsername(String username);

    Boolean updateByPid(Plan plan);

    Boolean addPlan(Plan plan);

    void setTaskState(String tid);

    void deletePlan(String pid);

    List<Plan> searchPlan(Plan plan, String pstart2, String pend2);
}
