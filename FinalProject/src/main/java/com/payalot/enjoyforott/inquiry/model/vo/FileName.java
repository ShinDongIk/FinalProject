package com.payalot.enjoyforott.inquiry.model.vo;


public class FileName {
	
	private String changeName;
	private String originName;
	public FileName() {
		super();
	}
	@Override
	public String toString() {
		return "FileName [changeName=" + changeName + ", originName=" + originName + "]";
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public FileName(String changeName, String originName) {
		super();
		this.changeName = changeName;
		this.originName = originName;
	}

}
