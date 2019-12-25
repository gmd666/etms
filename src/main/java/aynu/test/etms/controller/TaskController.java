package aynu.test.etms.controller;

import aynu.test.etms.beans.Plan;
import aynu.test.etms.beans.Task;
import aynu.test.etms.beans.User;
import aynu.test.etms.service.PlanService;
import aynu.test.etms.service.TaskService;
import aynu.test.etms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TaskController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private UserService userService;
    @Autowired
    private PlanService planService;
    private Map<String,String> errors = new HashMap<String, String>();
    /**
     * 1.获取下拉菜单中人员的列表；
     * 2.调用函数；
     * 3.返回页面；
     * @throws IOException
     */
    @RequestMapping("/getSelect.do")
    public String getSelect(HttpServletRequest request, String url,HttpServletResponse response) throws IOException {

        List<User> userlist = findByBid(request, response);

        if(userlist!=null) {
            request.setAttribute("userlist", userlist);
            return url;
        }else {
            request.setAttribute("msg", "您没有下属请通知管理员为您添加!");
            return url;
        }

    }
    /**
     * 查看人员；(该方法需要被重复的调用）
     * 1.获取人员列表；
     */
    public List<User> findByBid(HttpServletRequest request, HttpServletResponse response) throws IOException {

        User user = (User) request.getSession().getAttribute("Luser");
        if(user==null) {
            response.getWriter().println("<h1>session消失，请重新登陆！</h1>");
            return null;
        }
        String bid = user.getId();

        List<User> userlist = userService.finByBid(bid);
        if(userlist!=null&&userlist.size()>0) {
            return userlist;
        }else {
            response.getWriter().println("<h1>您没有下属，获取为空</h1>");
        }

        return null;
    }
    /**
     * 制定任务；
     * 1.获取内容；
     * 2.错误判断；
     * 3.返回错误；
     * 4.发送到数据；
     * 5.发送信息到页面；
     */
    @RequestMapping("/addTask.do")
    public String addTask(HttpServletRequest request, Task task)  {
        task.setTid(Tools.uuid());//设置任务id;
        task.setMid(request.getParameter("mid"));
        //验证是否有错误；
        checkTask(task);
        if(errors.size()>0) {
            request.setAttribute("task", task);
            request.setAttribute("errors", errors);
            request.setAttribute("msg", "添加错误！请检查内容！");
            return "jsps/director/addTask.jsp";
        }
        taskService.addTask(task);
        request.setAttribute("msg1", "添加任务成功！请查看");

        return "jsps/director/addTask.jsp";
    }

    /**
     * 错误检查
     * @param task
     */
    private void checkTask(Task task) {
        // TODO Auto-generated method stub
        errors.clear();
        //验证任务名；
        String taskName = task.getTname();
        if(taskName == null || taskName.trim().isEmpty()) {
            errors.put("tname","任务名不能为空！");
        }else if(taskName.length()<2) {
            errors.put("tname", "任务名长度不能小于2！");
        }
        //检查时间是否出错；
        String tstart = task.getTstart();
        String tend = task.getTend();
        if(tstart == null || tstart.trim().isEmpty()) {
            errors.put("tstart","开始时间不能为空！");
        }else if(tend == null || tend.trim().isEmpty()) {
            errors.put("tend","结束时间不能为空！");
        }else {
            int time1 = toInt(tstart);
            int time2 = toInt(tend);
            if(time1>=time2) {
                errors.put("tend","时间设置错误，请重新设置！");
            }
        }
    }

    /**
     * 判断时间是否错误
     * @param str
     * @return
     */
    private int toInt(String str) {
        // TODO Auto-generated method stub
        String str2="";
        for(int i=0;i<str.length();i++){
            if(str.charAt(i)>=48 && str.charAt(i)<=57){
                str2+=str.charAt(i);
            }
        }
        return Integer.parseInt(str2);
    }
    /**
     * 查询所有任务
     * 1.返回list;
     */
    @RequestMapping("/taskSelect.do")
    public String taskSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String mid = request.getParameter("mid");
        List<Task> tasklist = taskService.taskSelect(mid);

        if(tasklist.size()>0) {
            request.setAttribute("tasklist", tasklist);
            return "jsps/director/selectTask.jsp";
        }else {
            response.getWriter().println("<h1>您还没有添加任务，获取为空</h1>");
        }
        return null;
    }
    /**
     * 根据任务的id查询任务的详细信息；
     * 1.获取tid;
     * 2.数据库查询；
     * 3.返回查询的结果；
     */
    @RequestMapping("/findByTid.do")
    public String findByTid(HttpServletRequest request) {

        String tid  = request.getParameter("tid");
        Task task = taskService.findByTid(tid);
        List<Plan> planList = planService.findByTid(tid);

        if(task!=null) {
            request.setAttribute("planList", planList);
            request.setAttribute("task", task);
            return "jsps/director/TaskDetails.jsp";
        }

        return null;
    }
    /**
     * 根据pid获取计划详情；
     */
    @RequestMapping("/findByPid.do")
    public String findByPid(HttpServletRequest request) throws  IOException {
        // TODO Auto-generated method stub
        String pid = request.getParameter("pid");
        String tname = request.getParameter("tname");
        tname=new String(tname.getBytes("iso8859-1"),"UTF-8");

        Plan plan = planService.findByPid(pid);
        if(plan!=null) {
            request.setAttribute("tname", tname);
            request.setAttribute("plan",plan);
            return "jsps/director/PlanDetails.jsp";
        }
        return null;
    }
    /**页面调用
     * 1.跟踪任务；
     * 2.返回状态为1的任务；
     * 3.返回任务到页面；
     */
    @RequestMapping("/findTask.do")
    public String findTask(HttpServletRequest request)  {

        String mid = request.getParameter("mid");
        List<Task> tasklist = taskService.findTask(mid);

        if(tasklist!=null&&tasklist.size()>0) {
            request.setAttribute("msg1", "查询成功！");
            request.setAttribute("tasklist", tasklist);
            return "jsps/director/looktask.jsp";
        }else {
            request.setAttribute("msg", "没有正在实施中的任务！");
            return "jsps/director/looktask.jsp";
        }
    }
    /**
     * 查看详细信息
     * 根据id获取详细信息；
     * 转发信息到桌面；
     */
    @RequestMapping("/changeState.do")
    public String changeState(HttpServletRequest request)  {

        String tid = request.getParameter("id");
        Task task = taskService.findByTid(tid);
        List<Plan> planList = planService.findByTid(tid);

        if(task!=null&&planList!=null) {
            request.setAttribute("planList", planList);
            request.setAttribute("task", task);
            return "jsps/director/Tasking.jsp";
        }

        return null;
    }
    /**
     * 修改任务的状态；
     * 1.获取id 和状态；
     * 2.提交数据库后修改；
     */
    @RequestMapping("/editTaskState.do")
    public String editTaskState(HttpServletRequest request) {

        String tid = request.getParameter("tid");
        String tstate = request.getParameter("tstate");
        String mid = request.getParameter("mid");

        Boolean flag = taskService.editState(tid,tstate);

        if(flag) {
            request.setAttribute("msg2", "修改成功！");
        }else {
            request.setAttribute("msg3", "修改失败！");
        }
        request.setAttribute("mid",mid);

        return findTask(request);
    }
    /**
     * 调整任务
     * 1.获取所有未实施的任务
     * 2.封装任务列表；
     * 3.转发到页面；
     */
    @RequestMapping("/changeTask.do")
    public String changeTask(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String mid = request.getParameter("mid");
        List<Task> taskList = taskService.findUntask(mid);

        if(taskList!=null&&taskList.size()>0) {
            request.setAttribute("tasklist", taskList);
            return "jsps/director/ChangeTask.jsp";
        }else {
            response.getWriter().println("<h1>您还没有添加任务，获取为空</h1>");
            request.setAttribute("msg", "获取失败！");
        }

        return null;
    }
    /**
     * 修改内容；
     * 1.根据id获取内容；
     * 2.封装后发送；
     * 3.页面；
     */
    @RequestMapping("/modifyTask.do")
    public String modifyTask(HttpServletRequest request,String url, HttpServletResponse response) throws  IOException {

        String tid = request.getParameter("tid");
        Task task = taskService.findByTid(tid);

        if(task!=null) {
            request.setAttribute("Tuser", task.getTuser());
            request.setAttribute("task", task);
            return getSelect(request,url,response);
        }

        return null;
    }
    /**
     * 更新内容；
     */
    @RequestMapping("/updateTask.do")
    public String updateTask(HttpServletRequest request,Task task, HttpServletResponse response) throws  IOException {

        checkTask(task);
        if(errors.size()>0) {
            request.setAttribute("task", task);
            request.setAttribute("errors", errors);
            request.setAttribute("msg", "内容错误！请检查内容！");
            return "jsps/director/Editask.jsp";
        }
        taskService.updateTask(task);
        request.setAttribute("msg1", "修改任务成功！请查看");

        return changeTask(request, response);

    }
    /**
     * 获取userlist转发到网页；
     */
    @RequestMapping("/lookUser.do")
    public String lookUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<User> userList = findByBid(request, response);

        if(userList!=null) {
            request.setAttribute("msg1", "查询成功！");
            request.setAttribute("userlist", userList);
            return "jsps/director/lookUser.jsp";
        }else {
            request.setAttribute("msg", "查询失败！");
            return "jsps/director/lookUser.jsp";
        }

    }
    /**
     * 获取用户的详细信息；
     */
    @RequestMapping("/userDetails.do")
    public String userDetails(HttpServletRequest request, HttpServletResponse response) throws  IOException {

        String id = request.getParameter("id");
        User user = userService.findById(id);
        if(user!=null) {
            request.setAttribute("user", user);
            return "jsps/director/UserDetails.jsp";
        }else {
            response.getWriter().println("<h1>user为空，数据库出错！</h1>");
        }

        return null;
    }

}
