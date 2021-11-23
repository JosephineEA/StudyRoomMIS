package team.mis.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import team.mis.study.entity.Posting;
import team.mis.study.entity.Replying;
import team.mis.study.entity.User;
import team.mis.study.service.PostingService;
import team.mis.study.service.ReplyingService;
import team.mis.study.service.impl.PostingServiceImpl;
import team.mis.study.service.impl.ReplyingServiceImpl;
import team.mis.study.utils.JsUtil;
import team.mis.study.vo.PostAndReplyView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Time: 2021/9/11 9:42
 * Description: main/forum, main/forum/{id}
 */
@Controller
@RequestMapping("main/forum")
public class ForumController {
    @Autowired
    PostingService postingService = new PostingServiceImpl();

    @Autowired
    ReplyingService replyingService = new ReplyingServiceImpl();

    @RequestMapping(method = RequestMethod.GET)
    public String toForum(HttpServletRequest req) {
        List<Posting> postingList = postingService.findAll();
        req.setAttribute("postingList", postingList);
        return "forum";
    }

    @RequestMapping(method = RequestMethod.POST)
    public void posting(@RequestParam("title") String title,
                          @RequestParam("content") String content,
                          HttpSession session,
                          HttpServletResponse resp) throws IOException {
        User user = (User) session.getAttribute("user");

        Posting posting = new Posting();
        posting.setTitle(title);
        posting.setContent(content);
        posting.setTime(new Date());
        posting.setUserId(user.getUserId());
        postingService.add(posting);
        JsUtil.print(resp, "alert('发帖成功！');window.location.href='forum';");
    }

    /**
     * 浏览帖子
     * @param postingId
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String toPost(@PathVariable("id") String postingId,
                         HttpServletRequest req) {
        Posting posting = postingService.findByPk(postingId);
        List<Replying> replyingList = replyingService.findByPosting(posting);
        PostAndReplyView postAndReplyView = new PostAndReplyView();
        postAndReplyView.setPosting(posting);
        postAndReplyView.setReplyingList(replyingList);
        req.setAttribute("postAndReplyView", postAndReplyView);
        return "postContent";
    }

    /**
     * 回复帖子
     * @param postingId
     * @param content
     * @param resp
     * @param session
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public void replying(@PathVariable("id") String postingId,
                           @RequestParam("content") String content,
                           HttpServletResponse resp,
                           HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");

        Replying replying = new Replying();
        replying.setPostingId(postingId);
        replying.setContent(content);
        replying.setTime(new Date());
        replying.setUserId(user.getUserId());
        replyingService.add(replying);

        JsUtil.print(resp, "alert('回帖成功！');history.go(-1);");
    }
}
