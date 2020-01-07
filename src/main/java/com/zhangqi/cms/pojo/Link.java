package com.zhangqi.cms.pojo;

public class Link {

	/**  **/
	private Integer id;
	/**  **/
	private String text;
	/**  **/
	private String url;
	/**  **/
	private String created;
	public Link(Integer id, String text, String url, String created) {
		super();
		this.id = id;
		this.text = text;
		this.url = url;
		this.created = created;
	}
	public Link() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	@Override
	public String toString() {
		return "Link [id=" + id + ", text=" + text + ", url=" + url + ", created=" + created + "]";
	}
	
	
}
