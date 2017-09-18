package com.xxl.job.executor.service.jobhandler;

import com.xxl.job.activemq.jms.consumer.JMSConsumer;
import com.xxl.job.activemq.jms.consumer.JMSHttpConsumerSingleton;
import com.xxl.job.activemq.jms.consumer.JMSHttpConsumerSingletonMulti;
import com.xxl.job.activemq.jms.face.MessageHandler;
import com.xxl.job.activemq.jms.multithread.MultiThreadMessageListener;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHander;
import com.xxl.job.core.log.XxlJobLogger;
import com.xxl.job.core.util.JacksonUtil;

import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.StreamMessage;
import javax.jms.TextMessage;


/**
 * 任务Handler的一个Demo（Bean模式）
 *
 * 开发步骤：
 * 1、继承 “IJobHandler” ；
 * 2、装配到Spring，例如加 “@Service” 注解；
 * 3、加 “@JobHander” 注解，注解value值为新增任务生成的JobKey的值;多个JobKey用逗号分割;
 * 4、执行日志：需要通过 "XxlJobLogger.log" 打印执行日志；
 *
 * @author xuxueli 2015-12-19 19:43:36
 */
@JobHander(value="mqHtmlJobMultiHandler")
@Service
public class MqHtmlMultiJobHandler extends IJobHandler {

	@Override
	public ReturnT<String> execute(String... params) throws Exception {
		String queue=params[0];
		JMSHttpConsumerSingletonMulti.HttpConsumer(queue);
		XxlJobLogger.log("监听队列！queue:"+queue);
		return ReturnT.SUCCESS;
	}
}
