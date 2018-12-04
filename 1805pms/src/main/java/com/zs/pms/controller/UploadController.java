package com.zs.pms.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
@RequestMapping("/upload/common.do")
@ResponseBody
public String UploadFile(MultipartFile file,HttpServletRequest req){
	//获得upload文件夹的物理路径
	String path=req.getRealPath("/upload");
	//创建新文件名（目标文件）
	//利用uuid
	UUID uuid=UUID.randomUUID();
	//目标文件名 32位码+原文件文件名和后缀
	String destFileName=uuid.toString()+file.getOriginalFilename();
	//创建新文件
	File destfile=new File(path+File.separator+destFileName);
	try {
		file.transferTo(destfile);
		return destFileName;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return "error";
	}
	
}
}
