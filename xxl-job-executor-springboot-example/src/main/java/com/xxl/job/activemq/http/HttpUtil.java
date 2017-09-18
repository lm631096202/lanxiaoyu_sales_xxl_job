package com.xxl.job.activemq.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;

import com.xxl.job.core.util.JacksonUtil;

public class HttpUtil {
	public static String getFromHttp(String Url,Map<String, String> data){
		HttpClient client = new HttpClient(new HttpClientParams(),new SimpleHttpConnectionManager(true)); 
		PostMethod method = new PostMethod(Url);  //post过去	
		client.getHttpConnectionManager().getParams().setConnectionTimeout(600*1000);
		client.getHttpConnectionManager().getParams().setSoTimeout(600*1000);
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		 
	    /**
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", account), 
			    //new NameValuePair("password", "密码"), //密码可以使用明文密码或使用32位MD5加密
			    new NameValuePair("password", StringUtil.MD5Encode(password)),
			    new NameValuePair("mobile", mobile), 
			    new NameValuePair("content", content),
		};
		**/
		String SubmitResult;
		
		method.setRequestBody(generatNameValuePair(data));		 
		
		try {
			client.executeMethod(method);	
			
			//SubmitResult =method.getResponseBodyAsString();  
			BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream()));  
			StringBuffer stringBuffer = new StringBuffer();  
			String str = "";  
			while((str = reader.readLine())!=null){  
			    stringBuffer.append(str);  
			}
			SubmitResult = stringBuffer.toString();
			 
			//System.out.println("111"+SubmitResult);
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			method.releaseConnection();  
		}
//		Map map=JacksonUtil.readValue(SubmitResult, Map.class);
        return SubmitResult;
		
	}
	/**  
     * MAP类型数组转换成NameValuePair类型  
     * @param properties  MAP类型数组  
     * @return NameValuePair类型数组  
     */  
    private static NameValuePair[] generatNameValuePair(Map<String, String> properties) {  
    	try {
    		NameValuePair[] nameValuePair = new NameValuePair[properties.size()];  
            int i = 0;  
            for (Map.Entry<String, String> entry : properties.entrySet()) {  
                nameValuePair[i++] = new NameValuePair(entry.getKey(), String.valueOf(entry.getValue()));  
            }  
      
            return nameValuePair; 
		} catch (Exception e) {
			NameValuePair[] data = {
			};
			//e.printStackTrace();
			return data; 
		}
         
    } 
    public static void main(String[] args) {
    	String re=HttpUtil.getFromHttp("http://lanxiaoyubaby.haikushilan.net/weixin/test/test", null);
		System.out.println(re);
	}
}
