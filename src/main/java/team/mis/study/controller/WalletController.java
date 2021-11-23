package team.mis.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import team.mis.study.entity.Customer;
import team.mis.study.entity.CustomerFinance;
import team.mis.study.entity.User;
import team.mis.study.service.CustomerFinanceService;
import team.mis.study.service.CustomerService;
import team.mis.study.utils.JsUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Time: 2021/9/11 15:42
 * Description: main/wallet, main/wallet/recharge
 */
@Controller
@RequestMapping("main/wallet")
public class WalletController {
    @Autowired
    CustomerService customerService;

    @Autowired
    CustomerFinanceService customerFinanceService;

    /**
     * 返回我的钱包，显示余额信息
     * @param req
     * @param session
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String toWallet(HttpServletRequest req, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Customer customer = customerService.findByUser(user);
        req.setAttribute("money", customer.getMoney());
        return "myWallet";
    }

    /**
     * 返回账户流水
     * @return
     */
    @RequestMapping(value = "/record", method = RequestMethod.GET)
    public String toConsume(HttpServletRequest req, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<CustomerFinance> customerFinanceList = customerFinanceService.findByUser(user);
        req.setAttribute("customerFinanceList", customerFinanceList);
        return "walletRecord";
    }

    /**
     * 账户充值界面
     */
    @RequestMapping(value = "/recharge", method = RequestMethod.GET)
    public String toRecharge() {
        return "walletRecharge";
    }

    @RequestMapping(value = "/recharge", method = RequestMethod.POST)
    public void recharge(@RequestParam("money") String m,
            HttpServletResponse resp,
            HttpSession session) throws IOException {
        double money = Double.parseDouble(m);
        User user = (User) session.getAttribute("user");
        CustomerFinance customerFinance = new CustomerFinance();
        customerFinance.setUserId(user.getUserId());
        customerFinance.setMoney(money);
        customerFinance.setTime(new Date());
        customerFinance.setJudgeIn(true);
        customerFinanceService.add(customerFinance);
        Customer customer = customerService.findByUser(user);
        customer.setMoney(customer.getMoney()+money);
        customerService.updateMoney(customer);
        JsUtil.print(resp, "alert('充值成功！');window.location.href='';");
    }
}
