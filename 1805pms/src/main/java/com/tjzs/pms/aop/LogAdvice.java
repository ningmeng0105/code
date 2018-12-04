package com.tjzs.pms.aop;

import java.util.Date;
import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import com.tjzs.pms.utils.DButil;


/**
 * 日志记录
 * @author Administrator
 *
 */
public class LogAdvice {
	//注入DButil
	@Autowired//按类型自动装配
	private DButil db;
	//需要记录的日志的方法
	private List<String> mlist;
	//添加setter和getter
	public List<String> getMlist() {
		return mlist;
	}

	public void setMlist(List<String> mlist) {
		this.mlist = mlist;
	}
	public Object log(ProceedingJoinPoint method){
		//返回值
		Object rtn=null;
		try {
			//获得执行参数
			Object[] args=method.getArgs();
			//执行方法返回值
			rtn=method.proceed();
			//遍历需要记录的方法
			for (String name : mlist) {
				//判断操作是否需要记录
				if (name.equals(method.getSignature().getName())) {
					//做日志记录，获得方法名
					System.out.println("日志记录----"+new Date()+method.getSignature().getName());
					//从spring中抽取
//					ApplicationContext ac=new ClassPathXmlApplicationContext("applicationcontext.xml");
//					DButil db=(DButil)ac.getBean("dbutil");
					//拼sql
					String sql="insert into tlog values(null,now(),?)";
					//传参
					Object[] objs={method.getSignature().getName()};
					//调用方法
					db.execUpdate(sql, objs);
				}
			}
			
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}catch (Throwable e) {
			// TODO: handle exception
		}
		return rtn;
	}
	
}
