package team.mis.study.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Time: 2021/9/8 15:16
 * Description: TODO
 */
public class DateUtil {
    public final String[] times = {"08:00", "08:30", "09:00", "09:30", "10:00", "10:30",
            "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00",
            "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30",
            "20:00", "20:30", "21:00"};

    public static String[] getCurrent7Days() {
        String[] week = new String[7];
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        Date date = new Date();
        calendar.setTime(date);
        week[0] = sdf.format(calendar.getTime());
        for (int i = 1; i < 7; i++) {
            calendar.add(Calendar.DATE, 1);
            week[i] = sdf.format(calendar.getTime());
        }
        return week;
    }

    public static double time2hour(String beginTime, String endTime) {
        // 这里的beginTime和endTime只包括时间，不包括日期
        double hour = Double.parseDouble(endTime.substring(0, 2)) - Double.parseDouble(beginTime.substring(0, 2));
        if (beginTime.contains("30") && endTime.contains("00")) {
            hour -= 0.5;
        } else if (beginTime.contains("00") && endTime.contains("30")) {
            hour += 0.5;
        }
        return hour;
    }

    public static String int2Str(int hour, int minute) {
        String str = "";
        if (hour < 10) {
            str += "0";
        }
        str = str + hour + ":";
        if (minute < 10) {
            str += "0";
        }
        str += minute;
        return str;
    }
}
