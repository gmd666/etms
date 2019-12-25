package aynu.test.etms.dao;

import aynu.test.etms.beans.Plan;
import aynu.test.etms.beans.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlanDao {
    List<Plan> findByTid(String tid);

    Plan findByPid(String pid);

    List<Task> findByUsername(String username);

    Boolean updateByPid(Plan plan);

    Boolean addPlan(Plan plan);

    void setTaskState(String tid);

    void deletePlan(String pid);

    List<Plan> searchPlan(@Param("plan") Plan plan, @Param("pstart2") String pstart2,  @Param("pend2") String pend2);
}
