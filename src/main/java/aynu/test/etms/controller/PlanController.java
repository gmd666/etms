package aynu.test.etms.controller;

import aynu.test.etms.beans.Plan;
import aynu.test.etms.beans.Task;
import aynu.test.etms.service.PlanService;
import aynu.test.etms.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@Controller
public class PlanController {
    @Autowired
    private PlanService planService;
    @Autowired
    private TaskService taskService;

    /**
     * 该方法可以重复调用；
     * 1.获取用户名和链接；
     * 2.根据用户名检索数据库返回任务列表；
     * 3.根据链接进行跳转；
     */
    @RequestMapping("/getTask.do")
    public String getTask(HttpServletRequest request, HttpServletResponse response) throws  IOException {

        String username = request.getParameter("username");

        username=new String(username.getBytes("iso8859-1"),"UTF-8");

        String url = request.getParameter("url");

        if(username==null) {
            if(username==null) {
                response.getWriter().println("<h1>session失效，请重新登陆！</h1>");
            }
        }

        List<Task> tasklist = planService.findByUsername(username);
        if(tasklist!=null&&tasklist.size()>0) {
            //System.out.println(tasklist.size());
            request.setAttribute("tasklist", tasklist);
            return url;
        }else {
            System.out.println(tasklist.size());
            response.getWriter().println("<h1>您当前还没有任务，请添加！</h1>");
        }

        return null;
    }
    /**
     * 1.发送任务的详细信息
     * 2.发送计划的列表；（未完成）
     * 3.
     */
    @RequestMapping("/drawPlan.do")
    public String drawPlan(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String tid = request.getParameter("tid");

        if(tid==null) {
            tid = (String) request.getSession().getAttribute("tid");
        }

        request.getSession().setAttribute("tid", tid);
        Task task = taskService.findByTid(tid);
        List<Plan> planlist = planService.findByTid(tid);

        if(task!=null || planlist.size()>0) {
            request.setAttribute("planlist", planlist);
            request.setAttribute("task", task);
            return "jsps/employee/DrawPlan.jsp";
        }else {
            response.getWriter().print("<h1>查询失败！</h1>");
        }

        return null;
    }
    /**
     * 1.根据pid获取计划并修改；
     */
    @RequestMapping("/backInfo.do")
    public String backInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String pid = request.getParameter("pid");
        Plan plan = planService.findByPid(pid);

        if(plan!=null) {
            request.setAttribute("pid", pid);
            request.setAttribute("plan", plan);
            return "jsps/employee/BackInfo.jsp";
        }else {
            response.getWriter().print("<h1>获取失败！</h1>");
        }

        return null;
    }
    /**
     * 1.获取两个状态和反馈信息；
     */
    @RequestMapping("/updateInfo.do")
    public String updateInfo(HttpServletRequest request, Plan plan,HttpServletResponse response) throws  IOException {

        Boolean flag = planService.updateByPid(plan);

        if(flag) {
            request.setAttribute("msg1", "修改成功！");
            return drawPlan(request, response);
        }else {
            response.getWriter().print("<h1>修改失败！</h1>");
        }

        return null;
    }

    /**
     * 第一步获取任务id;
     * @param request
     * @return
     */
    @RequestMapping("/forAddPlan.do")
    public String forAddPlan(HttpServletRequest request) {

        String tid  = request.getParameter("tid");

        request.setAttribute("tid", tid);

        return "jsps/employee/AddPlan.jsp";
    }
    /**
     * 1.添加任务后发送到任务列表；
     *
     */
    @RequestMapping("/addPlan.do")
    public String addPlan(HttpServletRequest request,Plan plan, HttpServletResponse response) throws  IOException {

        plan.setPid(Tools.uuid());//设置计划的id;
        Boolean flag = planService.addPlan(plan);
        if(flag) {//发送任务页面；
            //更改任务状态
            planService.setTaskState(plan.getTid());
            String username = request.getParameter("username");
            List<Task> tasklist = planService.findByUsername(username);
            request.setAttribute("tasklist", tasklist);
            return "jsps/employee/PlanManagement.jsp";
        }else {
            response.getWriter().println("<h1>添加失败！session消失</h1>");
        }

        return null;
    }
    /**
     * 1.获取pid;
     * 2.设置pstate=-1;
     */
    @RequestMapping("/deletePlan.do")
    public String deletePlan (HttpServletRequest request, HttpServletResponse response) throws  IOException {

        String pid = request.getParameter("pid");

        planService.deletePlan(pid);

        request.setAttribute("msg1", "删除成功！");

        return drawPlan(request, response);
    }
    /**
     * 1.模糊查询；
     * 2.获取的内容有
     * 	1.计划的名称；
     *  2.所属的任务(tid)；
     *  3.开始时间；
     *  4.结束时间；
     *  5.是否反馈；
     * 3.使用原来的类；
     * 4.将原来的任务名发送回来保存在request中；
     * 5.不对内容进行检查；
     * 6.所有的内容封装在plan中；
     * 7.分离
     * 		1.分离tid 和 tname;
     * 		2.获取pstart2和pend2;
     * 8.封装url到gettask
     */
    @RequestMapping("/searchPlan.do")
    public String searchPlan(HttpServletRequest request,Plan plan) {

        String idname = plan.getTid();
        plan.setTid(idname.split(":")[0]);
        String tname = idname.split(":")[1];
        request.setAttribute("tname", tname);//设置tname;
        String username = request.getParameter("username");
        String pstart2 = request.getParameter("pstart2");
        String pend2 = request.getParameter("pend2");
        //System.out.println(plan.toString());
        List<Plan> planlist = planService.searchPlan(plan,pstart2,pend2);
        List<Task> tasklist = planService.findByUsername(username);

        if(planlist!=null) {
            request.setAttribute("tasklist", tasklist);
            request.setAttribute("planlist", planlist);
            return "jsps/employee/SearchPlan.jsp";
        }
        return null;
    }

}
