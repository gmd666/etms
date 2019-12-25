package aynu.test.etms.interceptor;

import aynu.test.etms.beans.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的url
        String url = String.valueOf(request.getRequestURL());
        if (url.indexOf("/faceLogin.do")>=0){
            return true;
        }
        if (url.indexOf("/userLogin.do")>=0){
            return true;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("Luser");
        if (user!=null){
            return true;
        }
        request.setAttribute("msg", "您还没有登录！或者session消失，请重新登录");
        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

}
