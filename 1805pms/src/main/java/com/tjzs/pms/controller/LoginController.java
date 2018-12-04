package com.tjzs.pms.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TUser;
import com.tjzs.pms.service.UserService;
import com.tjzs.pms.vo.QueryUser;

/**
 * 登录控制器
 * @author Administrator
 *
 */
@Controller
public class LoginController {

	@Autowired//注入业务
	UserService us;
	
	@RequestMapping("tologin.do")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping("/login.do")//url
	public String login(QueryUser query,ModelMap map,HttpSession session,HttpServletResponse resp){
		//创建查询对象
		try {
			//从session中获取图片的验证码
			String code=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			//判断 从session中获取的验证码是否等于输入的验证码
			if (!code.equals(query.getChkcode())) {
				System.out.println(query.getChkcode());
				//验证失败 带数据回页面
				map.addAttribute("msg", "验证码有误，请重新输入");
				//转发 回到登录页面
				return "login";
			}
			//验证码相同，校验登录
			//调用登录方法判断是否登录成功
		
			TUser chkLogin = us.chkLogin(query);
			
			//登陆成功把 登录信息放到session中
			session.setAttribute("userBean", chkLogin);
			
			// 判断是否记住密码 --要判空否则会报错
			if (query.getRem() != null && query.getRem().equals("1")) {
				// 创建cookie 记住账号密码
				Cookie cookie1 = new Cookie("loginname", query.getLoginname());
				Cookie cookie2 = new Cookie("password", query.getPassword());
				// 设置cookie的有效时长
				cookie1.setMaxAge(60);
				cookie2.setMaxAge(60);
				// 将cookie响应给浏览器
				resp.addCookie(cookie1);
				resp.addCookie(cookie2);
			}
//			// 转发主页面
			return "main";

		} catch (AppException e) {
			// TODO Auto-generated catch block
			// 登录失败提示
			map.addAttribute("msg", e.getErrMsg()) ;
			//转发
			return "login";
		}catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("totop.do")
	public String toTop(){
		return "top";
	}
	
	@RequestMapping("toleft.do")
	public String toLeft(){
		return "left";
	}
	
	@RequestMapping("toright.do")
	public String toRight(){
		return "right";
	}

}
