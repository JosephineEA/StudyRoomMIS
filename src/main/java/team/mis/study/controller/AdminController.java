package team.mis.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import team.mis.study.entity.*;
import team.mis.study.service.*;
import team.mis.study.utils.JsUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Time: 2021/9/11 11:07
 * Description: TODO
 */
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @Autowired
    CustomerSeatInfoService customerSeatInfoService;

    @Autowired
    CustomerService customerService;

    @Autowired
    UserService userService;

    @Autowired
    PostingService postingService;

    @Autowired
    BusinessFinanceService businessFinanceService;

    @Autowired
    ReplyingService replyingService;

    /**
     * 管理员后台管理系统主界面
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String toMain() {
        return "adminMain";
    }

    /**
     * 管理员登录
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin() {
        return "adminLogin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(@RequestParam("userId") String userId,
                        @RequestParam("password") String password,
                        HttpServletResponse resp,
                        HttpSession session) throws IOException {
        Admin ad = new Admin();
        ad.setUserId(userId);
        Admin admin = adminService.find(ad);
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        if (admin == null) {
            out.print("<script>alert('用户不存在，请重新登录！');history.go(-1);</script>");
        } else if (!admin.getPassword().equals(password)) {
            out.print("<script>alert('密码错误，请重新登录！');history.go(-1);</script>");
        } else {
            session.setAttribute("admin", admin);
            out.print("<script>alert('登录成功！');window.location.href='main';</script>");
        }
        out.flush();
        out.close();
    }

    /**
     * logout路径映射
     * @param session
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void logout(HttpServletResponse resp, HttpSession session) throws IOException {
        session.removeAttribute("admin");
        JsUtil.print(resp, "alert('退出登录成功！');window.location.href='login';");
    }

    /**
     * 座位控制
     */
    @RequestMapping(value = "/main/seat", method = RequestMethod.GET)
    public String toSeat(HttpServletRequest req) {
        List<CustomerSeatInfo> customerSeatInfoList = customerSeatInfoService.findAll();
        req.setAttribute("customerSeatInfoList", customerSeatInfoList);
        return "adminSeat";
    }

    /**
     * 删除座位预约记录
     */
    @RequestMapping(value = "/main/seat/{id}", method = RequestMethod.GET)
    public void modifySeat(@PathVariable("id") String id,
                             HttpServletResponse resp) throws IOException {
        customerSeatInfoService.deleteByPk(id);
        JsUtil.print(resp,"alert('删除记录成功！');window.location.href='../seat';");
    }

    /**
     * 用户信息管理
     */
    @RequestMapping(value = "/main/user", method = RequestMethod.GET)
    public String toUser(HttpServletRequest req) {
        List<Customer> customerList = customerService.findAll();
        req.setAttribute("customerList", customerList);
        return "adminUser";
    }

    @RequestMapping(value = "/main/user/{id}/{violationCount}", method = RequestMethod.GET)
    public void modifyUser(@PathVariable("id") String id,
                           @PathVariable("violationCount") String violationCount,
                           HttpServletResponse resp) throws IOException {
        User user = new User();
        user.setUserId(id);
        Customer customer = customerService.findByUser(user);
        Integer vcInt = Integer.parseInt(violationCount);
        customer.setViolationCount(vcInt);
        customerService.updateViolationCount(customer);
        JsUtil.print(resp, "alert('用户信息修改成功！');window.location.href='../../user';");
    }

    @RequestMapping(value = "/main/forum", method = RequestMethod.GET)
    public String toForum(HttpServletRequest req) {
        List<Posting> postingList = postingService.findAll();
        req.setAttribute("postingList", postingList);
        return "adminForum";
    }

    @RequestMapping(value = "/main/forum/{id}", method = RequestMethod.GET)
    public void modifyForum(@PathVariable("id") String id,
                            HttpServletResponse resp) throws IOException {
        replyingService.deleteByPostingId(id);
        postingService.deleteByPk(id);
        JsUtil.print(resp, "alert('删帖成功!');window.location.href='../forum';");
    }

    /**
     * 查询自习室资金记录
     */
    @RequestMapping(value = "/main/wallet", method = RequestMethod.GET)
    public String toWallet(HttpServletRequest req) {
        List<BusinessFinance> businessFinanceList = businessFinanceService.findAll();
        req.setAttribute("businessFinanceList", businessFinanceList);
        return "adminWalletRecord";
    }
}
