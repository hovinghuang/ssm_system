package com.ssm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ssm.pojo.InitialPreviewConfig;
import com.ssm.pojo.Photo;
import com.ssm.pojo.PhotoPlus;
import com.ssm.pojo.PhotoType;
import com.ssm.service.PhotoService;
import com.ssm.service.PhotoTypeService;
import com.ssm.util.FileUpload;

@Controller
@RequestMapping("")
public class PhotoController {
	@Autowired
	PhotoService photoService;
	@Autowired
	PhotoTypeService photoTypeService;

	@RequestMapping("listPhotoPage")
	public String listPhotoPage(Model model) {
		// 相册列表的记录总数
		int amount = photoService.total();
		model.addAttribute("amount", amount);
		return "photo-list";
	}

	@ResponseBody
	@RequestMapping("listPhotoTable")
	public JSONObject listPhotoTable(String draw, String start, String length) {
		int amount = photoService.total();
		List<Photo> photoList = photoService.list();
		List<PhotoPlus> photoPlusList = new ArrayList<PhotoPlus>();
		int mydraw = 0, mystart = 0, mylength = 0, mypage = 0;
		// 获取前端的分页参数
		mydraw = Integer.parseInt(draw);
		mystart = Integer.parseInt(start);
		mylength = Integer.parseInt(length);
		mypage = (mystart / mylength) + 1;
		System.out.println("访问次数mydraw==" + mydraw);
		System.out.println("起始下标mystart==" + mystart);
		System.out.println("列表长度mylength==" + mylength);
		// System.out.println("当前页数mypage==" + mypage);

		for (int i = 0; i < photoList.size(); i++) {
			PhotoPlus photoPlus = new PhotoPlus();
			Photo p = photoList.get(i);
			int tid = p.getTid();
			String typename = photoTypeService.findPhotoTypeById(tid).getName();
			photoPlus.setId(p.getId());
			photoPlus.setName(p.getName());
			photoPlus.setDescription(p.getDescription());
			photoPlus.setUploaduser(p.getUploaduser());
			photoPlus.setFilename(p.getFilename());
			photoPlus.setSalt(p.getSalt());
			photoPlus.setUploadtime(p.getUploadtime());
			photoPlus.setPhototype(typename);
			photoPlusList.add(photoPlus);
		}
		int mylen = 0;
		if ((amount - (mypage - 1) * mylength) > 10) {
			mylen = mylength;
		} else {
			mylen = amount - (mypage - 1) * mylength;
		}
		List<PhotoPlus> pageList = new ArrayList<PhotoPlus>();
		for (int i = 0; i < mylen; i++) {
			pageList.add(photoPlusList.get(mystart + i));
		}

		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", pageList);
		info.put("draw", mydraw);
		info.put("start", mystart);
		info.put("length", mylength);
		info.put("recordsTotal", amount);
		info.put("recordsFiltered", amount);
		String a = JSON.toJSONString(info);
		JSONObject photo_table = JSONObject.parseObject(a);
		return photo_table;
	}

	@RequestMapping("addPhotoPage")
	public String addPhotoPage(Model model) {
		List<PhotoType> photoTypeList = photoTypeService.list();
		model.addAttribute("photoTypeList", photoTypeList);
		for (PhotoType photoType : photoTypeList) {
			System.out.println("photoType.getName()==" + photoType.getName());
		}
		return "photo-add";
	}

	@ResponseBody
	@RequestMapping(value = "addPhoto", method = RequestMethod.POST)
	public String addPhoto(@RequestParam("filename") MultipartFile[] files, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String name = request.getParameter("name");
		int tid = Integer.parseInt(request.getParameter("photoType"));
		String description = request.getParameter("description");
		System.out.println("name==" + name);
		System.out.println("description==" + description);

		// 获取当前时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);

		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
		int times = 2;
		String algorithmName = "md5";
		// 设置默认保存路径，设置当前时间
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改
		String filename = name;
		String uploadtime = dateNowStr;

		String encodedfilename = new SimpleHash(algorithmName, filename, salt, times).toString();

		String savefileurl = photo_url + File.separator + encodedfilename;
		System.out.println("savefileurl==" + savefileurl);
		FileUpload fileUpload = new FileUpload();
		Photo photo = new Photo();

		try {
			// 将图片文件写入photo文件夹CommonsMultipartFile file
			fileUpload.saveFile(files, savefileurl);

			// 将拿到的相册信息插入数据库
			photo.setName(name);
			photo.setDescription(description);
			photo.setUploaduser(userName);
			photo.setFilename(encodedfilename);
			photo.setSalt(salt);
			photo.setUploadtime(uploadtime);
			photo.setTid(tid);
			photoService.add(photo);

			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}

	}

	@ResponseBody
	@RequestMapping("deletePhoto")
	public String deletePhoto(Model model, long id) {
		Photo photo = photoService.findPhotoById((int) id);
		// 设置默认保存路径，设置当前时间
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改
		String filename = photo.getFilename();
		String encodedfilename = filename;
		String folderPath = photo_url + File.separator + encodedfilename;

		try {
			// 根据id删除用户
			photoService.delete((int) id);
			// 根据id查出文件夹，删除文件夹
			try {
				System.out.println("folderPath==" + folderPath);
				FileUtils.deleteDirectory(new File(folderPath));// tmp目录下面包含多个子文件夹和文件
			} catch (Exception e) {
				// 向前端返回操作失败的json信息
				JSONObject json = new JSONObject();
				json.put("msg", "error");
				return json.toJSONString();
			}

			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}
	}

	// 根据id批量删除用户

	@ResponseBody
	@RequestMapping("deletePhotos")
	public String deletePhotos(Integer[] idArray) {
		// 设置默认保存路径，设置当前时间
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改

		try {
			// 遍历数组
			for (int i = 0; i < idArray.length; i++) { // 根据id批量删除用户
				Photo photo = photoService.findPhotoById(idArray[i]);
				String filename = photo.getFilename();
				String encodedfilename = filename;
				String folderPath = photo_url + File.separator + encodedfilename;
				FileUtils.deleteDirectory(new File(folderPath));// tmp目录下面包含多个子文件夹和文件
				photoService.delete(idArray[i]);
			}
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}
	}

	@RequestMapping("editPhotoPage")
	public String editPhotoPage(Model model, int id) {
		Photo photo = photoService.findPhotoById(id);
		model.addAttribute("photo", photo);

		List<PhotoType> photoTypeList = photoTypeService.list();
		model.addAttribute("photoTypeList", photoTypeList);
		for (PhotoType photoType : photoTypeList) {
			System.out.println("photoType.getName()==" + photoType.getName());
		}
		return "photo-edit";
	}

	@ResponseBody
	@RequestMapping("getEditPhoto")
	public String getEditPhoto(Model model, int id) {
		Photo photo = photoService.findPhotoById(id);
		String filename = photo.getFilename();
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改

		String filePath = photo_url + File.separator + filename;
		System.out.println("filePath:" + filePath);
		File[] files = new File(filePath).listFiles();
		String webfilename = filename;
		List<String> photonamelist = new ArrayList<String>();
		List<InitialPreviewConfig> conList = new ArrayList<InitialPreviewConfig>();
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().replaceAll("(.jpg|.png|.gif|)+", "").length() != files[i].getName().length()) {
					/* System.out.println(files[i].getName()); */
					String getPhotoUrl = "/ssm_system/photo/" + webfilename + "/" + files[i].getName();
					Map<String, String> extra = new HashMap<String, String>();
					String str = "photoname";
					extra.put(str, files[i].getName());
					InitialPreviewConfig con = new InitialPreviewConfig(files[i].getName(), 576237, "120px",
							"editDeletePhoto", id, extra);
					photonamelist.add(getPhotoUrl);
					conList.add(con);
					System.out.println(getPhotoUrl);
				}
			}
		}
		// 向前端返回操作成功的json信息
		JSONObject json = new JSONObject();
		json.put("msg", "success");
		json.put("path", photonamelist);
		json.put("con", conList);
		return json.toJSONString();
	}

	@ResponseBody
	@RequestMapping("editDeletePhoto")
	public String editDeletePhoto(Model model, int key, String photoname) {
		Photo photo = photoService.findPhotoById(key);
		String filename = photo.getFilename();
		/* String photoname = extra.get("photoname").toString(); */
		// 设置默认保存路径，设置当前时间
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改
		String delphotoname = photo_url + File.separator + filename + File.separator + photoname;

		try {
			// 根据id查出文件夹，删除文件夹
			try {
				System.out.println("delphotoname==" + delphotoname);
				File delphoto = new File(delphotoname);
				delphoto.delete();// 删除文件
			} catch (Exception e) {
				// 向前端返回操作失败的json信息
				JSONObject json = new JSONObject();
				json.put("msg", "error");
				return json.toJSONString();
			}

			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "editPhoto", method = RequestMethod.POST)
	public String editPhoto(@RequestParam("filename") MultipartFile[] files, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, int id) {
		String userName = (String) session.getAttribute("userName");
		String name = request.getParameter("name");
		int tid = Integer.parseInt(request.getParameter("photoType"));
		String description = request.getParameter("description");
		System.out.println("name==" + name);
		System.out.println("description==" + description);

		// 获取当前时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);

		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
		int times = 2;
		String algorithmName = "md5";
		// 设置默认保存路径，设置当前时间
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改
		String filename = name;
		String uploadtime = dateNowStr;

		String encodedfilename = new SimpleHash(algorithmName, filename, salt, times).toString();

		FileUpload fileUpload = new FileUpload();
		Photo photo = photoService.findPhotoById(id);
		String oldfilename = photo.getFilename();
		String oldsalt = photo.getSalt();
		String savefileurl = photo_url + File.separator + oldfilename;
		System.out.println("savefileurl==" + savefileurl);
		String folderPath = photo_url + File.separator + photo.getFilename();

		try {
			// 将图片文件写入photo文件夹CommonsMultipartFile file
			if (files != null) {
				/* FileUtils.deleteDirectory(new File(folderPath)); */// tmp目录下面包含多个子文件夹和文件
				fileUpload.saveFile(files, savefileurl);
			}

			// 将拿到的相册信息插入数据库
			photo.setName(name);
			photo.setDescription(description);
			photo.setUploadtime(uploadtime);
			photo.setUploaduser(userName);
			photo.setTid(tid);
			photo.setFilename(oldfilename);
			photo.setSalt(oldsalt);

			photoService.update(photo);

			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}

	}

	@RequestMapping("searchPhotoByKeyPage")
	public String searchPhotoByKeyPage() {
		return "photo-search";
	}

	@ResponseBody
	@RequestMapping("searchPhotoByKey")
	public JSONObject searchPhotoByKey(String key) {
		System.out.println("查找key：" + key);
		List<PhotoPlus> photoPlusList = new ArrayList<PhotoPlus>();
		List<Photo> photoList = photoService.searchPhotoByKey(key);
		for (Photo p : photoList) {
			System.out.println("查找到的对象：" + p.getName());
		}
		for (int i = 0; i < photoList.size(); i++) {
			PhotoPlus photoPlus = new PhotoPlus();
			Photo p = photoList.get(i);
			int tid = p.getTid();
			String typename = photoTypeService.findPhotoTypeById(tid).getName();
			photoPlus.setId(p.getId());
			photoPlus.setName(p.getName());
			photoPlus.setDescription(p.getDescription());
			photoPlus.setUploaduser(p.getUploaduser());
			photoPlus.setFilename(p.getFilename());
			photoPlus.setSalt(p.getSalt());
			photoPlus.setUploadtime(p.getUploadtime());
			photoPlus.setPhototype(typename);
			photoPlusList.add(photoPlus);
		}
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", photoPlusList);
		String a = JSON.toJSONString(info);
		JSONObject photo_table = JSONObject.parseObject(a);
		return photo_table;
	}

	@RequestMapping(value = { "showPhotoPage" }, method = { RequestMethod.GET, RequestMethod.POST,
			RequestMethod.OPTIONS })
	public ModelAndView showPhotoPage(Model model, int id) {
		Photo photo = photoService.findPhotoById(id);
		String filename = photo.getFilename();
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改

		String filePath = photo_url + File.separator + filename;
		System.out.println("filePath:" + filePath);
		File[] files = new File(filePath).listFiles();
		String webfilename = filename;
		model.addAttribute("webfilename", webfilename);
		List<String> photonamelist = new ArrayList<String>();
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().replaceAll("(.jpg|.png|.gif|)+", "").length() != files[i].getName().length()) {
					System.out.println(files[i].getName());
					photonamelist.add(files[i].getName());
				}
			}
		}
		model.addAttribute("photonamelist", photonamelist);
		ModelAndView mav = new ModelAndView("photo-show");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = { "showPhoto" }, method = { RequestMethod.GET, RequestMethod.POST, RequestMethod.OPTIONS })
	public void showPhoto(Model model, HttpServletRequest request, HttpServletResponse httpResponse, int id) {
		Photo photo = photoService.findPhotoById(id);
		String filename = photo.getFilename();
		String photo_url = "D:\\Workspaces\\Eclipse For JavaEE\\ssm_system\\WebContent\\photo";// 这是绝对路径，项目部署到云端必须要修改

		String filePath = photo_url + File.separator + filename;
		System.out.println("filePath:" + filePath);

		File[] files = new File(filePath).listFiles();
		for (int i = 0; i < files.length; i++) {
			if (files[i].getName().replaceAll("(.jpg|.png|.gif|)+", "").length() != files[i].getName().length()) {
				System.out.println(files[i].getName());

				File file = files[i];
				FileInputStream fis = null;
				try {

					httpResponse.setContentType("image/jpge");
					OutputStream out = httpResponse.getOutputStream();
					fis = new FileInputStream(file);
					byte[] b = new byte[fis.available()];

					fis.read(b);
					out.write(b);
					out.flush();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
}
