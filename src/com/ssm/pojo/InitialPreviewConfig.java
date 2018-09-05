package com.ssm.pojo;

import java.util.Map;

public class InitialPreviewConfig {
	private String caption;
	private int size;
	private String width;
	private String url;
	private int key;
	private Map<String, String> extra;

	public InitialPreviewConfig(String caption, int size, String width, String url, int key,
			Map<String, String> extra) {
		this.caption = caption;
		this.size = size;
		this.width = width;
		this.url = url;
		this.key = key;
		this.extra = extra;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public Map<String, String> getExtra() {
		return extra;
	}

	public void setExtra(Map<String, String> extra) {
		this.extra = extra;
	}

}
