package com.ssm.util;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public int saveFile(MultipartFile[] files, String savefileurl) {
		// 判断file数组不能为空并且长度大于0
		if (files != null && files.length > 0) {
			// 循环获取file数组中得文件
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				// 保存文件
				saveFile(file, savefileurl);
			}
		}
		return 1;

	}

	private boolean saveFile(MultipartFile file, String path) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				File filepath = new File(path);
				if (!filepath.exists())
					filepath.mkdirs();
				// 文件保存路径
				String savePath = path + File.separator + file.getOriginalFilename();
				// 转存文件
				file.transferTo(new File(savePath));
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
