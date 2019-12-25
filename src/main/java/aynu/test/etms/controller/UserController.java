package aynu.test.etms.controller;

import aynu.test.etms.beans.User;
import aynu.test.etms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    private Map<String, String> errors = new HashMap<String, String>();
    /**
     * 登录验证
     * 页面传回用户名id和密码，身份
     */
   @RequestMapping("/userLogin.do")
    public String userLogin(HttpServletRequest request) {
       String identify = request.getParameter("identify");
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       //System.out.println(identify+":"+username+":"+password);
       //用户合法性检测；
       User user = userService.findUserByLogin(username, password);
       if (user != null && user.getIdentify().equals(identify)) {
           request.getSession().setAttribute("Luser", user);
           if (identify.equals("管理员")) {
               return "jsps/admin/admin_index.jsp";
           } else if (identify.equals("主管")) {
               return "jsps/director/director_index.jsp";
           } else {
               return "jsps/employee/employee_index.jsp";
           }
       } else {
           request.setAttribute("msg", "请重新检测所选角色，用户名和密码是否正确!");
           return "jsps/Login.jsp";
       }
   }
    /**
     * 前端页面发送表单
     * 绑定数据，添加到数据库；
     *
     */
    @RequestMapping("/addEmployee.do")
    public String addEmployee(User user,HttpServletRequest request) {
        user.setId(Tools.uuid());//设置员工id;
        int mutalCount = userService.getCount();//获取所有员工的数量；
        user.setEid(10000+mutalCount+1);//设置员工工号；
        user.setState(1);//设置员工状态
        user.setBid("");
        user.setBname("");

        checkEmployee(user);
        /*
         * 添加到数据库如果添加成功返回true失败，返回false;
         * 1.如果添加成功返回信息
         */
        if(errors.size()>0) {
            request.setAttribute("msg", "输入不合法,提交失败!");
            request.setAttribute("user", user);
            request.setAttribute("errors", errors);
            return "jsps/admin/addEmployee.jsp";
        }
        Boolean flag = userService.addEmployee(user);
        if(flag) {
            request.setAttribute("msg1", "添加成功！该员工的工号是："+user.getEid());
            return "jsps/admin/addEmployee.jsp";
        }
        request.setAttribute("msg1", "添加失败！");
        return "jsps/admin/addEmployee.jsp";
    }
    /*
     * 检验合法性；
     */
    private void checkEmployee(User user) {
        // TODO Auto-generated method stub
        errors.clear();//清空错误；

        String username = user.getUsername();
        //用户名重复性检测
        Boolean flag = userService.findByUserName(username);
        if(flag) {
            errors.put("username","用户名重复！");
        }
        else if(username == null || username.trim().isEmpty()) {
            errors.put("username","用户名不能为空！");
        }else if(username.length()<3 || username.length()>10) {
            errors.put("username", "用户名的长度在3-10之间！");
        }
        //验证密码；
        String password = user.getPassword();
        if(password == null || password.trim().isEmpty()) {
            errors.put("password","密码不能为空！");
        }else if(password.length()<3 || password.length()>20) {
            errors.put("password", "用户名的长度在3-20之间！");
        }
        //验证真实姓名；
        String truename = user.getTruename();
        if(truename == null || truename.trim().isEmpty()) {
            errors.put("truename","真实姓名不能为空！");
        }else if(truename.length()<2 || truename.length()>10) {
            errors.put("truename", "真实姓名的长度在2-10之间！");
        }
    }
    /**
     * 1.查询员工；
     * 2.查询所有员工
     * 3.返回userList；
     */
    @RequestMapping("/userSelect.do")
    public String userSelect(HttpServletRequest request) {
        List<User> userlist = userService.userSelect();
        if(userlist.size()>0) {
            request.setAttribute("userlist", userlist);
            return "jsps/admin/select_employees.jsp";
        }
        return null;
    }
    /**
     * 1.查看员工详细内容；
     */
    @RequestMapping("/findById.do")
    public String findById(HttpServletRequest request) {
        String id = request.getParameter("id");
        User user = userService.findById(id);
        if(user!=null) {
            request.setAttribute("user", user);
            return "jsps/admin/lookDetails.jsp";
        }

        return null;
    }
    /**
     * 1.根据id删除学生信息；
     * 2.假删除设置state=0
     */
    @RequestMapping("/deleteById.do")
    public String deleteById(HttpServletRequest request) {
        String id = request.getParameter("id");
        userService.deleteById(id);
        request.setAttribute("msg", "删除成功！");
        return "/userSelect.do";
    }
    /**
     * 未分配人员查询
     */
    @RequestMapping("/allotUser.do")
    public String allotUser(HttpServletRequest request){
        List<User> userlist = userService.allotUser();
        if(userlist.size()>0) {
            request.setAttribute("userlist", userlist);
            return "jsps/admin/allot.jsp";
        }
        request.setAttribute("msg", "没有员工需要分配");
        return "jsps/admin/allot.jsp";
    }
    /**
     * 分配部门；
     */
    @RequestMapping("/allotApart.do")
    public String allotApart(HttpServletRequest request) throws UnsupportedEncodingException {
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        List<User> userlist = userService.getBoss();
        if(userlist.size()>0) {
            request.setAttribute("eid", request.getParameter("id"));
            request.setAttribute("name", name);
            request.setAttribute("userlist", userlist);
            return "jsps/admin/allotApart.jsp";
        }
        return null;
    }
    /**
     * 主管添加；
     * 1.获取eid;
     * 2.获取主管id;
     * 3.分离主管姓名；
     * 4.发送到数据库；
     */
    @RequestMapping("/allotBoss.do")
    public String allotBoss(HttpServletRequest request) {
        String eid = request.getParameter("Eid");
        String bIdName = request.getParameter("buser");
        String bid = bIdName.split(":")[0];
        String bname = bIdName.split(":")[1];

        userService.allotBoss(eid,bid,bname);
        request.setAttribute("msg1", "该员工分配部门成功！");

        return "/allotUser.do";
    }
    /**
     * 数据恢复；
     * 查找状态为0的人员返回列表显示在页面；
     * 页面点击恢复按钮数据重新设置为状态；
     */
    @RequestMapping("/dataReturn.do")
    public String dataReturn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // TODO Auto-generated method stub
        List<User> userlist = userService.dataReturn();
        if(userlist!=null){
            request.setAttribute("userlist", userlist);
            return "jsps/admin/DataReturn.jsp";
        }else{
            response.getWriter().print("<h1>没有人员需要恢复！</h1>");
        }

        return null;
    }
    /**
     * 恢复人员；
     * 根据id设置；其状态为1；
     */
    @RequestMapping("/returnById.do")
    public String  returnById(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id");
        Boolean flag = userService.returnById(id);

        if(flag){
            response.getWriter().print("<h1>恢复成功！请查看</h1>");
        }else{
            response.getWriter().print("<h1>恢复失败！</h1>");
        }

        return null;
    }
    /**
     * 退出后销毁session
     */
    @RequestMapping("/quit.do")
    public String quit(HttpServletRequest request){
        request.getSession().invalidate();
        return "jsps/Quit.jsp";
    }
}
