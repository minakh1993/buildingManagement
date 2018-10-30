package com.websystique.springmvc.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * @author mina khoshnevisan
 * 30/10/2018
 */
public class DateUtils {

    static int[][] grgSumOfDays = new int[][]{{0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365},
            {0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366}};
    static int[][] hshSumOfDays = new int[][]{{0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 365},
            {0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 366}};

    private static boolean jalalianYearIsLeap(int year) {
        year = (year - 474) % 128;
        year = ((year >= 30) ? 0 : 29) + year;
        year = year - (int) Math.floor(year / 33) - 1;
        return ((year % 4) == 0);
    }

    private static boolean gregorianYearIsLeap(int year) {
        return ((year % 4) == 0 && ((year % 100) != 0 || (year % 400) == 0));
    }

    public static String gregorianToJalali(int grgYear, int grgMonth, int grgDay) {
        int hshYear = grgYear - 621;
        int hshMonth = 0, hshDay = 0;

        boolean grgLeap = gregorianYearIsLeap(grgYear);
        boolean hshLeap = jalalianYearIsLeap(hshYear - 1);

        int hshElapsed;
        int grgElapsed = grgSumOfDays[(grgLeap ? 1 : 0)][grgMonth - 1] + grgDay;

        int XmasToNorooz = (hshLeap && grgLeap) ? 80 : 79;

        if (grgElapsed <= XmasToNorooz) {
            hshElapsed = grgElapsed + 286;
            hshYear--;
            if (hshLeap && !grgLeap)
                hshElapsed++;
        } else {
            hshElapsed = grgElapsed - XmasToNorooz;
            hshLeap = jalalianYearIsLeap(hshYear);
        }

        for (int i = 1; i <= 12; i++) {
            if (hshSumOfDays[(hshLeap ? 1 : 0)][i] >= hshElapsed) {
                hshMonth = i;
                hshDay = hshElapsed - hshSumOfDays[(hshLeap ? 1 : 0)][i - 1];
                break;
            }
        }

        // Padding with zero
        String jalalianYearString = String.format("%04d", hshYear);
        String jalalianMonthString = String.format("%02d", hshMonth);
        String jalalianDayString = String.format("%02d", hshDay);

        return jalalianYearString + "/" + jalalianMonthString + "/" + jalalianDayString;
    }

    public static String gregorianToJalali(Date date) {
        String ret = "";
        if (date != null) {
            Calendar c = Calendar.getInstance();
            c.setTime(date);

            int gy1 = c.get(Calendar.YEAR);
            int gm1 = c.get(Calendar.MONTH);
            gm1++;
            int gd1 = c.get(Calendar.DAY_OF_MONTH);
            ret = gregorianToJalali(gy1, gm1, gd1);
        }
        return ret;
    }

    public static String gregorianToJalaliWithTime(Date date) {
        StringBuilder time = new StringBuilder(gregorianToJalali(date));
        time.append(' ');

        Calendar c = Calendar.getInstance();
        c.setTime(date);
        time.append(c.get(Calendar.HOUR_OF_DAY)).append(':');
        time.append(c.get(Calendar.MINUTE));
        time.append(c.get(Calendar.SECOND));
        return time.toString();
    }

    public static Date jalaliToGregorian(String jalalianDat) {
        String[] jDateSections = jalalianDat.split("/");

        int jalalianYear = new Integer(jDateSections[0]);
        int jalalianMonth = new Integer(jDateSections[1]);
        int jalalianDay = new Integer(jDateSections[2]);

        int gregorianYear = jalalianYear + 621;
        int gregorianMonth = 0, gregorianDay = 0;

        boolean jalalianYearLeap = jalalianYearIsLeap(jalalianYear);
        boolean gregorianYearLeap = gregorianYearIsLeap(gregorianYear);

        int hshElapsed = hshSumOfDays[jalalianYearLeap ? 1 : 0][jalalianMonth - 1] + jalalianDay;
        int grgElapsed;

        if (jalalianMonth > 10 || (jalalianMonth == 10 && hshElapsed > 286 + (gregorianYearLeap ? 1 : 0))) {
            grgElapsed = hshElapsed - (286 + (gregorianYearLeap ? 1 : 0));
            gregorianYearLeap = gregorianYearIsLeap(++gregorianYear);
        } else {
            jalalianYearLeap = jalalianYearIsLeap(jalalianYear - 1);
            grgElapsed = hshElapsed + 79 + (jalalianYearLeap ? 1 : 0)
                    - (gregorianYearIsLeap(gregorianYear - 1) ? 1 : 0);
        }

        for (int i = 1; i <= 12; i++) {
            if (grgSumOfDays[gregorianYearLeap ? 1 : 0][i] >= grgElapsed) {
                gregorianMonth = i;
                gregorianDay = grgElapsed - grgSumOfDays[gregorianYearLeap ? 1 : 0][i - 1];
                break;
            }
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, gregorianYear);
        calendar.set(Calendar.MONTH, (gregorianMonth - 1));
        calendar.set(Calendar.DAY_OF_MONTH, gregorianDay);

        return calendar.getTime();
    }

    public static Date floor(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    public static Date ceil(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }

    public static long datesDayDiff(Date toDate, Date fromDate) {
        if (toDate == null || fromDate == null)
            return 0L;
        toDate = floor(toDate);
        fromDate = floor(fromDate);
        long len = toDate.getTime() - fromDate.getTime();
        len = Math.abs(len);
        len = len / 86400000;
        return len + 1;
    }

    public static void main(String[] args) {
        Date jalaliDate = jalaliToGregorian("1396/10/02");
        System.out.println("jalaliDate = " + jalaliDate);

        String gregorianToJalali = gregorianToJalali(2017, 12, 23);
        System.out.println("gregorianToJalali = " + gregorianToJalali);
    }
}
