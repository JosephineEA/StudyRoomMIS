package team.mis.study.utils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Time: 2021/9/11 13:32
 * Description: TODO
 */
public class JsUtil {
    public static void print(HttpServletResponse resp, String msg) throws IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.print("<script>" + msg + "</script>");
        out.flush();
        out.close();
    }
}
