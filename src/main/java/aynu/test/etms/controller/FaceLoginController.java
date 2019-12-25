package aynu.test.etms.controller;

import aynu.test.etms.beans.User;
import aynu.test.etms.controller.FaceLogin.AuthService;
import aynu.test.etms.controller.FaceLogin.HttpUtil;
import aynu.test.etms.controller.FaceLogin.faceSearch;
import aynu.test.etms.service.UserService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
public class FaceLoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/faceLogin.do")
    public void faceLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("请求到了");
        String imageStr = request.getParameter("message");
        faceSearch facesearch = new faceSearch();
        String result = facesearch.search(imageStr);

        JsonObject jsonObject = (JsonObject) new JsonParser().parse(result);
        //在此获取eid和身份；根据eid查询数据库获取user
        String eid = jsonObject.get("user_id").getAsString();
        String identify = jsonObject.get("user_info").getAsString();
        //System.out.println(identify);
        User user = userService.findByEid(eid);
        /*
         * 1.将user保存到session中；
         * 2.根据身份进行跳转；
         */
        if(user!=null&&user.getIdentify().equals(identify)){
            request.getSession().setAttribute("Luser", user);
            response.setContentType("text/html; charset=utf-8");
            int score=0;
            if(identify.equals("管理员")){
                score=1;
                response.getWriter().println(score);
            }else if(identify.equals("主管")){
                score=2;
                response.getWriter().println(score);
            }else {
                score=3;
                response.getWriter().println(score);
            }
        }else {
            System.out.println("登陆失败！");
        }
    }
    @RequestMapping("/addFace.do")
    public void addFace (HttpServletRequest request, HttpServletResponse response){
        System.out.println("请求到了4");
        /**
         * 1.设置百度云接口链接；
         * 2.获取前端的数据；
         * 3.前端数据转码
         * 4.获取access_token;
         * 5.获取百度云链接，注册人脸；
         */
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            String imgStr = request.getParameter("message");
            String eid = request.getParameter("Eid");
            String role = request.getParameter("Role");
            String imgParam = URLEncoder.encode(imgStr,"UTF-8");
            String params = "user_id=" +eid + "&user_info=" + role + "&group_id=" + "TestFace" + "&image_type=BASE64" + "&image=" + imgParam ;

            AuthService authService = new AuthService();

            String accessToken = authService.getAuth();

            String result = HttpUtil.post(url, accessToken, params);
            /**
             * 如果错误代码为0;
             * 发送数据；
             */
            if(result.split(":")[1].split(",")[0].equals("0")) {
                int score=90;
                response.setContentType("text/html; charset=utf-8");
                response.getWriter().println(score);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
