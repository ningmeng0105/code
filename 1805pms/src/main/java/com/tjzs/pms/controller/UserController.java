package com.tjzs.pms.controller;

import java.security.interfaces.DSAKey;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
/**
 * 用户管理模块
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TDep;
import com.tjzs.pms.po.TUser;
import com.tjzs.pms.service.DeptService;
import com.tjzs.pms.service.UserService;
import com.tjzs.pms.vo.QueryUser;
@Controller
public class UserController {
	@Autowired
	UserService us;
	
	@Autowired
	DeptService ds;
	
	@RequestMapping("userlist.do")
	public String userList(QueryUser query,String currentpage,ModelMap map){
		//获取当前页数
		try{		
		if (currentpage==null||"".equals(currentpage)) {
			currentpage="1";
		}
		//调用查询方法
		List<TUser> users=us.queryByPage(query, Integer.parseInt(currentpage));
		//获取总页数
		int pageCount=us.queryPageCount(query);
		//使当前面继续返回到页面中
		map.addAttribute("currentPage", currentpage);
		//将总页数返回页面
		map.addAttribute("pageCount", pageCount);
		//带回分页数据
		map.addAttribute("users", users);
		//回带查询条件
		map.addAttribute("QUERY", query);
		return "Tuser/list";
		
		}catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/toadd.do")
	public String toAdd(ModelMap map){
		//获得一级部门列表
		List<TDep> list1=ds.queryByPid(0);
		map.addAttribute("depts1", list1);
		//获得一级部门下的二级部门列表
		List<TDep> list2=ds.queryByPid(list1.get(0).getId());
		map.addAttribute("depts2", list2);
		return "Tuser/add";
	}
	
	/*
	 * 以AJAX方式响应
	 * 方法返回string 则*.jsp的返回类型为直接返回文本
	 * 方法返回对象 返回json格式 自动调用JSONArray
	 */
	@RequestMapping("/getdep.do")
	@ResponseBody
	public List<TDep> getDept(int pid){
		List<TDep> list=ds.queryByPid(pid);
		return list;
	}
	
	@RequestMapping("/useradd.do")
	public String userAdd(TUser user,ModelMap map,HttpSession session){
		
		try {
			//获得session中的用户信息
			TUser cuser=(TUser)session.getAttribute("userBean");
			user.setCreator(cuser.getId());
			//调用新增方法
			us.insert(user);
			//跳到指定URL上，不需要传参
			return "redirect:userlist.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return this.toAdd(map);
		}
	}
	
	@RequestMapping("/userdelete.do")
	public String userDelete(int id){
		try {
			us.delete(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:userlist.do";
	}
	
	@RequestMapping("/userdeletes.do")
	public String userDeletes(int[] ids){
		try {
			us.deleteByIds(ids);;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:userlist.do";
	}
	
	@RequestMapping("/userget.do")
	public String userGet(int id,ModelMap map){
		//通过页面传回的id查询用户
		TUser user=us.queryById(id);
		//将用户信息带回页面
		map.addAttribute("user", user);
		//获得一级部门列表
		List<TDep> list1=ds.queryByPid(0);
		map.addAttribute("depts1", list1);
		//获得该用户一级部门下的二级部门列表
		List<TDep> list2=ds.queryByPid(user.getDept().getPid());
		map.addAttribute("depts2", list2);
		return "Tuser/update";		
	}
	
	@RequestMapping("/userupdate.do")
	public String userUpdate(TUser user,ModelMap map,HttpSession session){
		try {
			//获得session中的用户信息
			TUser cuser=(TUser)session.getAttribute("userBean");
			user.setUpdator(cuser.getId());
			//调用新增方法
			us.update(user);
			//跳到指定URL上，不需要传参
			return "redirect:userlist.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return userGet(user.getId(),map);
		}
	}

}
