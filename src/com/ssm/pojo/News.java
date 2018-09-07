package com.ssm.pojo;

public class News {
	private Integer id;

	private Integer newstype_id;

	private String title;

	private String tpic_url;

	private String newsabstract;

	private Long user_id;

	private Integer reading;

	private Integer status;

	private String createtime;

	private String cpic_url;

	private Integer stick;

	private Integer audit;

	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNewstype_id() {
		return newstype_id;
	}

	public void setNewstype_id(Integer newstype_id) {
		this.newstype_id = newstype_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getTpic_url() {
		return tpic_url;
	}

	public void setTpic_url(String tpic_url) {
		this.tpic_url = tpic_url == null ? null : tpic_url.trim();
	}

	public String getNewsabstract() {
		return newsabstract;
	}

	public void setNewsabstract(String newsabstract) {
		this.newsabstract = newsabstract == null ? null : newsabstract.trim();
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public Integer getReading() {
		return reading;
	}

	public void setReading(Integer reading) {
		this.reading = reading;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime == null ? null : createtime.trim();
	}

	public String getCpic_url() {
		return cpic_url;
	}

	public void setCpic_url(String cpic_url) {
		this.cpic_url = cpic_url == null ? null : cpic_url.trim();
	}

	public Integer getStick() {
		return stick;
	}

	public void setStick(Integer stick) {
		this.stick = stick;
	}

	public Integer getAudit() {
		return audit;
	}

	public void setAudit(Integer audit) {
		this.audit = audit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}
}