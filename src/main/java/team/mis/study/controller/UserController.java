package team.mis.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import team.mis.study.entity.Customer;
import team.mis.study.entity.CustomerPersonal;
import team.mis.study.entity.User;
import team.mis.study.service.CustomerPersonalService;
import team.mis.study.service.CustomerService;
import team.mis.study.service.UserService;
import team.mis.study.utils.JsUtil;
import team.mis.study.utils.StrUtil;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Time: 2021/9/11 9:23
 * Description: 基于路径而不是基于对象构造控制器结构，包括对main, login, register, logout的映射
 */
@Controller
@RequestMapping
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    CustomerService customerService;
    @Autowired
    CustomerPersonalService customerPersonalService;

    /**
     * main 路径映射
     */
    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String toMain() {
        return "main";
    }

    /**
     * login路径映射
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String toLogin() { // 跳转封装
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public void login(@RequestParam("userId") String userId,
                      @RequestParam("password") String password,
                      HttpServletResponse resp,
                      HttpSession session) throws IOException {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        User userFromDB = userService.findUser(user);
        if (userFromDB == null) {
            JsUtil.print(resp, "alert('用户名不存在，请重新输入。');history.go(-1);");
        } else if (!user.getPassword().equals(userFromDB.getPassword())) {
            JsUtil.print(resp, "alert('密码错误，请重新输入。');history.go(-1);");
        } else {
            session.setAttribute("user", user);
            JsUtil.print(resp, "alert('登录成功！');window.location.href='main';");
        }
    }

    /**
     * register路径映射
     */
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String toRegister() { // 跳转封装
        return "register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public void register(@RequestParam("userId") String userId,
                         @RequestParam("password") String password,
                         @RequestParam("password2") String password2,
                         @RequestParam("name") String name,
                         @RequestParam("sex") String sex,
                         @RequestParam("birthday") String birthday,
                         @RequestParam("phone") String phone,
                         @RequestParam("email") String email,
                         @RequestParam("job") String job,
                         HttpServletResponse resp) throws IOException, ParseException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        if (!password.equals(password2)) {
            out.print("<script type='text/javascript'>"+
                    "alert('两次密码输入不一致，请重新输入。');"+
                    "history.go(-1);</script>");
        } else {
            User user = new User();
            user.setUserId(userId);
            user.setPassword(password);
            if (userService.findUser(user) != null) {
                out.print("<script type='text/javascript'>"+
                        "alert('用户名已被使用，请重新输入。');"+
                        "history.go(-1);</script>");
            } else {
                userService.addUser(user);
                Customer customer = new Customer();
                customer.setUserId(userId);
                customer.setMoney(0.0);
                customer.setViolationCount(0);
                customerService.add(customer);
                CustomerPersonal customerPersonal = new CustomerPersonal();
                customerPersonal.setUserId(userId);
                customerPersonal.setName(name);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                birthday = StrUtil.validStringNull(birthday);
                if (!birthday.equals("")) {
                    Date birth = sdf.parse(birthday);
                    customerPersonal.setBirthday(birth);
                }
                sex = StrUtil.validStringNull(sex);
                customerPersonal.setSex(sex);
                customerPersonal.setJob(job);
                customerPersonal.setPhone(phone);
                customerPersonal.setEmail(email);
                customerPersonalService.add(customerPersonal);
                out.print("<script>alert('注册成功！');window.location.href='login';</script>");
            }
        }
        out.flush();
        out.close();
    }

    /**
     * logout路径映射
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "login";
    }
}
