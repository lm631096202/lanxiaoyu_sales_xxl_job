package com.xxl.job.activemq.jms.consumer;

import java.util.Hashtable;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.StreamMessage;
import javax.jms.TextMessage;

import com.xxl.job.activemq.http.HttpUtil;
import com.xxl.job.activemq.jms.face.MessageHandler;
import com.xxl.job.activemq.jms.multithread.MultiThreadMessageListener;
import com.xxl.job.activemq.mq_util.ActiveMQUtil;
import com.xxl.job.activemq.mq_util.RegexUtils;
import com.xxl.job.core.log.XxlJobLogger;
import com.xxl.job.core.util.JacksonUtil;

public class JMSHttpConsumerSingletonMulti {
	private volatile static JMSHttpConsumerSingletonMulti consumerSingleton;
	private volatile static Hashtable<String, JMSConsumer> consumers = new Hashtable<String, JMSConsumer>();
	private static String tag = "name_queue";

	private JMSHttpConsumerSingletonMulti() {
	}

	public static synchronized JMSHttpConsumerSingletonMulti getInstance() {
		if (consumerSingleton == null) {
			consumerSingleton = new JMSHttpConsumerSingletonMulti();
		}
		return consumerSingleton;
	}
 
	public static JMSConsumer HttpConsumer(String queue) {
		JMSHttpConsumerSingletonMulti singleton=JMSHttpConsumerSingletonMulti.getInstance();
		synchronized (JMSHttpConsumerSingletonMulti.class) {
			if (singleton.consumers.containsKey(queue)) {
				try {
					singleton.consumers.get(queue).shutdown();
					singleton.consumers.get(queue).start();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return singleton.consumers.get(queue);
			} else {
				// ** JMSConsumer
				// 可以设置成全局的静态变量，只需实例化一次即可使用,禁止循环重复实例化JMSConsumer(因为其内部存在一个线程池)
				JMSConsumer consumer = new JMSConsumer();
				consumer.setBrokerUrl("tcp://localhost:61616");
				consumer.setQueue(queue);
				consumer.setQueuePrefetch(50000);
				final String  queue1=queue;
				consumer.setMessageListener(new MultiThreadMessageListener(10,
						new MessageHandler() {
							public void handle(Message message) {
								XxlJobLogger.log("处理中");
								Map data = onMessage(message);
								XxlJobLogger.log("data：");
								XxlJobLogger.log(data.toString());
								if (data != null) {
									String url = (String) data.get("url");
									XxlJobLogger.log("url:"+url);
									if (url != null) {
										String re = HttpUtil.getFromHttp(url,data);
										XxlJobLogger.log(re);
										if (re != null) {
											XxlJobLogger.log("返回结果："+re);
										}

									}

								}
								
								try {
									message.acknowledge();
									String end_url = (String) data.get("end_url");
									if(end_url!=null){
										queue_end(end_url, data);
									}
								} catch (JMSException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								
							}
							
						}));
				try {
					consumer.start();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// Thread.sleep(5000);
				// consumer.shutdown();
				singleton.consumers.put(queue, consumer);
				return consumer;
			}

		}
	}
	public static void queue_end(String end_url,Map map) {
		XxlJobLogger.log("end_url:"+end_url);
		if (end_url != null) {
			String re = HttpUtil.getFromHttp(end_url,
					map);
			XxlJobLogger.log(re);
			if (re != null) {
				XxlJobLogger.log("end返回："+re);
			}

		}
	}
	public static Map onMessage(Message m) {
		try {
			if (m instanceof TextMessage) {// 接收文件消息
				TextMessage message = (TextMessage) m;
				String str = message.getText();
				System.out.println(message.getText());
				Map map = JacksonUtil.readValue(str, Map.class);
				return map;
			} else if (m instanceof MapMessage) {// 接收键值消息
				MapMessage message = (MapMessage) m;
				return (Map) message;
			} else if (m instanceof StreamMessage) {// 接收流消息
				StreamMessage message = (StreamMessage) m;
				String str = message.readString();
				Map map = JacksonUtil.readValue(str, Map.class);
				return map;
			} else if (m instanceof BytesMessage) {
				byte[] b = new byte[1024];
				int len = -1;
				String str = null;
				BytesMessage message = (BytesMessage) m;
				while ((len = message.readBytes(b)) != -1) {
					str = new String(b, 0, len);
				}
				Map map = JacksonUtil.readValue(str, Map.class);
				return map;
			} else if (m instanceof ObjectMessage) {
				ObjectMessage message = (ObjectMessage) m;
				return (Map) message;
			} else {
				return (Map) m;
			}
		} catch (JMSException e) {
			e.printStackTrace();
			return null;
		}

	}
}