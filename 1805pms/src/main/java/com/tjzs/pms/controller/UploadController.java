package com.tjzs.pms.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	/**
	 * 普通文件上传
	 * @param file 新文件名
	 * @param 上传的文件 与input的name属性相同
	 */
	@RequestMapping("/upload/common.do")
	@ResponseBody
	public String uploadFile(MultipartFile file,HttpServletRequest req){
		//获得upload文件夹的物理路径
		String path=req.getRealPath("/upload");
		//创建新文件名
		//利用uuid算法 随机生成32位码
		/*
		 *uuid算法
		 * 根据网卡、时间、IP地址等信息自动生成绝不重复的32位码
		 */
		UUID uuid=UUID.randomUUID();
		//目标文件名 32位码+文件后缀(源文件的原始文件名)
		String destfilename=uuid.toString()+file.getOriginalFilename();
		//创建新文件 物理路径\新文件名
		//url：upload/新文件名
		File destfile=new File(path+File.separator+destfilename);
		//将原始文件拷贝到新文件
		try {
			file.transferTo(destfile);
			return destfilename;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
		
	}
	

}
