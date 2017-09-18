package com.xxl.job.activemq.jms.test;

import java.util.Map;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.MapMessage;  
import javax.jms.Message;  
import javax.jms.ObjectMessage;
import javax.jms.StreamMessage;
import javax.jms.TextMessage;
import com.xxl.job.activemq.jms.consumer.JMSConsumer;
import com.xxl.job.activemq.jms.face.MessageHandler;
import com.xxl.job.activemq.jms.multithread.MultiThreadMessageListener;
import com.xxl.job.core.util.JacksonUtil;
    
public class JMSConsumerTest {  
  
      
    public static void main(String[] args) throws Exception {  
          
        //**  JMSConsumer 可以设置成全局的静态变量，只需实例化一次即可使用,禁止循环重复实例化JMSConsumer(因为其内部存在一个线程池)  
  
        JMSConsumer consumer = new JMSConsumer();  
        consumer.setBrokerUrl("tcp://localhost:61616");  
        consumer.setQueue("test");  
        consumer.setUserName("system");  
        consumer.setPassword("manager");  
        consumer.setQueuePrefetch(500);  
        consumer.setMessageListener(new MultiThreadMessageListener(50,new MessageHandler() {  
            public void handle(Message message) {  
            	System.out.println(onMessage(message).get("password"));   
//            	try {
//					message.acknowledge();
//				} catch (JMSException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
            }  
        }));
        consumer.start();  
          
//      Thread.sleep(5000);  
//      consumer.shutdown();  
          
    }  
    public static Map onMessage(Message m) {  
        try{  
            if(m instanceof TextMessage){//接收文件消息  
                TextMessage message=(TextMessage)m;  
                String str=message.getText();
                System.out.println(message.getText());  
                Map map=JacksonUtil.readValue(str, Map.class);
                return map;
            }else if(m instanceof MapMessage){//接收键值消息  
                MapMessage message=(MapMessage)m;
                return (Map)message;
            }else if(m instanceof StreamMessage){//接收流消息  
                StreamMessage message=(StreamMessage)m;  
                String str= message.readString(); 
                Map map=JacksonUtil.readValue(str, Map.class);
                return map;
            }else if(m instanceof BytesMessage){  
                byte[] b=new byte[1024];  
                int len=-1;  
                String str=null;
                BytesMessage message=(BytesMessage)m;  
                while((len=message.readBytes(b))!=-1){  
                     str=new String(b,0,len);  
                }  
                Map map=JacksonUtil.readValue(str, Map.class);
                return map;
            }else if(m instanceof ObjectMessage){  
                ObjectMessage message=(ObjectMessage)m;
                return (Map)message;  
            }else{  
                return (Map)m;  
            }
        }catch(JMSException e){  
            e.printStackTrace();  
            return null;
        }
		
		
          
    }  
      
}  