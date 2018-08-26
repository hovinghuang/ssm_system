package com.ssm.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PictureCheckCode extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public PictureCheckCode() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void init() throws ServletException {
		super.init();
	}

	/* 该方法主要作用是获得随机生成的颜色 */
	public Color getRandColor(int s, int e) {
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r, g, b;
		r = s + random.nextInt(e - s); // 随机生成RGB颜色中的r值
		g = s + random.nextInt(e - s); // 随机生成RGB颜色中的g值
		b = s + random.nextInt(e - s); // 随机生成RGB颜色中的b值
		return new Color(r, g, b);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置不缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		// 指定生成的响应图片,一定不能缺少这句话,否则错误.
		response.setContentType("image/jpeg");

		// 在内存中创建图象
		int width = 65, height = 20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(230, 255));
		g.fillRect(0, 0, 100, 25);
		// 设定字体
		g.setFont(new Font("Arial", Font.CENTER_BASELINE | Font.ITALIC, 18));
		// 产生0条干扰线，
		g.drawLine(0, 0, 0, 0);
		// 取随机产生的认证码(4位数字)
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 将认证码显示到图象中
			g.setColor(getRandColor(100, 150));// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.drawString(rand, 15 * i + 6, 16);
		}
		for (int i = 0; i < (random.nextInt(5) + 5); i++) {
			g.setColor(new Color(random.nextInt(255) + 1, random.nextInt(255) + 1, random.nextInt(255) + 1));
			g.drawLine(random.nextInt(100), random.nextInt(30), random.nextInt(100), random.nextInt(30));
		}
		// String pageId =
		// StringEscapeUtils.escapeHtml(request.getString("pageId"));
		// String key = pageId + "_checkCode";
		// 将验证码存入页面KEY值的SESSION里面
		HttpSession session = request.getSession(true);
		session.setAttribute("randCheckCode", sRand);
		g.dispose(); // 释放g所占用的系统资源
		ImageIO.write(image, "JPEG", response.getOutputStream()); // 输出图片
	}
}
