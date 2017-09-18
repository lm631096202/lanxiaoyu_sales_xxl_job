package com.xxl.job.activemq.jms.test;

import java.util.HashMap;  
import java.util.Map;  

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.StreamMessage;
import javax.jms.TextMessage;

import com.xxl.job.activemq.jms.producer.JMSProducer;

public class JMSProducerTest {  
 
     
   public static void main(String[] args) {  
         
       locationTest();  
       System.out.println("over.");  
   }  
     
   private static void locationTest() {  
       //**  JMSProducer 可以设置成全局的静态变量，只需实例化一次即可使用,禁止循环重复实例化JMSProducer(因为其内部存在一个线程池)  
         
       //支持openwire协议的默认连接为 tcp://localhost:61616，支持 stomp协议的默认连接为tcp://localhost:61613。   
       //tcp和nio的区别  
       //nio://localhost:61617 以及 tcp://localhost:61616均可在 activemq.xml配置文件中进行配置  
       JMSProducer producer = new JMSProducer("tcp://localhost:61616", "system1", "manager");  
       Map<String, Object> map = new HashMap<String, Object>();  
       map.put("id", "1");  
       map.put("name", "sss1113333");  
       map.put("password", "password");  
       producer.send("test", map);  
   }  
   
}  