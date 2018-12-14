package com.edufe.framework.common;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

/**
 * 工具类
 * @author yangchao
 *
 */
public class Util {

	/**
	 * 字符串去空格方法
	 * @param s
	 * @return
	 */
	public static String trim(String s){
		if(null == s) return "";
		
		String ret = "";
		try{
			ret = s.trim();
		}catch(Exception ex){
		}
		return ret ;
	}
	
	public static String getClientIP(HttpServletRequest request) { 
	    String ip = request.getHeader("x-forwarded-for"); 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("Proxy-Client-IP"); 
	    } 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("WL-Proxy-Client-IP"); 

	    } 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getRemoteAddr(); 
	    } 
	    return ip; 
	} 
	
	/**
	 * 描述: 向左补位算法
	 * 
	 * @param      String sequence 序列值
	 * @param      String fill 补位值
	 * @param	   int digit 要求位数
	 */
	public static String leftFill(String sequence, String fill, int digit) {
		if (sequence == null || fill == null || "".equals(fill)) {
			return "";
		} else if (sequence.length() >= digit) {
			return sequence;
		}
		StringBuffer fillBuffer = new StringBuffer();
		fillBuffer.append(sequence);
		while (fillBuffer.length() < digit) {
			fillBuffer.insert(0, fill);
		}
		return fillBuffer.toString();
	}
	
	public static String getStringDate(Calendar cal, String pattern) {
		String stringDate = "";
		if (cal != null && pattern != null && !"".equals(pattern)) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			stringDate = sdf.format(cal.getTime());
		}
		return stringDate;
	}
	
	/**
	 * 
	 * 功能说明: 取得当前日期
	 */
	public static String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	private String basePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		return basePath;
	}
	
	/**
	 * 判断一个时间戳是否是昨天？
	 * @param timestamp
	 * @return
	 */
	public static boolean isYesterday(Date d) {
		if(null == d) return false;
		long timestamp = d.getTime();
	    Calendar c = Calendar.getInstance();
	    clearCalendar(c, Calendar.HOUR_OF_DAY, Calendar.MINUTE, Calendar.SECOND, Calendar.MILLISECOND);
	    c.add(Calendar.DAY_OF_MONTH, -1);
	    long firstOfDay = c.getTimeInMillis(); // 昨天最早时间

	    c.setTimeInMillis(timestamp);
	    clearCalendar(c, Calendar.HOUR_OF_DAY, Calendar.MINUTE, Calendar.SECOND, Calendar.MILLISECOND); // 指定时间戳当天最早时间

	    return firstOfDay == c.getTimeInMillis();
	}

	private static void clearCalendar(Calendar c, int... fields) {
	    for (int f : fields) {
	        c.set(f, 0);
	    }
	}
	
	public static int parseInt(String s){
		int ret = 0;
		try{
			ret = Integer.parseInt(s);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return ret;
	}
	
	public static int parseDouble(String s){
		int ret = 0;
		try{
			ret = (int)Double.parseDouble(s);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * 判断是年的第几周
	 * @return  返回日期是一年中的第几周
	 */ 		
	public static int getWeekOfYear(){
		int weekOfYear = 1;
		Calendar calendar=Calendar.getInstance();   
		calendar.setTime(new Date());
		weekOfYear=calendar.get(Calendar.WEEK_OF_YEAR);
		int year = calendar.get(Calendar.YEAR);
		return Integer.valueOf(year +"" +weekOfYear);
	}
	
	//整数相除  * 100  ,保留一位小数 ,求百分比
    public static double rate(int a ,int b){
    	if(a == 0) return 0d;
    	float num =(float)(Float.valueOf(a)/Float.valueOf(b)) * 100;
        BigDecimal b2 = new BigDecimal(num);
        double f1 = b2.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }
    
    public static double decimalScale(double d, int num){
        BigDecimal b2 = new BigDecimal(d);
        double f1 = b2.setScale(num, BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }
    
    public static String getUrlPrefix(String url) {
		String[] arr =  url.split("\\.");
		if(arr.length==4){
			return arr[0];
		}
		return "";
	} 
}
