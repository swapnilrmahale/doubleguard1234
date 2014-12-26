package com.action.reporting;

import java.sql.Timestamp;

public class AttackData {
	private Integer id;
	private String attack;
	private String ip;
	private String browser;
	private String os;
	private Timestamp time;
	
	public AttackData() {
		// TODO Auto-generated constructor stub
	}
	
	public AttackData(Integer id, String attack, String ip, String browser,
			String os, Timestamp time) {
		super();
		this.id = id;
		this.attack = attack;
		this.ip = ip;
		this.browser = browser;
		this.os = os;
		this.time = time;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AttackData other = (AttackData) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AttackData [id=" + id + ", attack=" + attack + ", ip=" + ip
				+ ", browser=" + browser + ", os=" + os + ", time=" + time
				+ "]";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAttack() {
		return attack;
	}
	public void setAttack(String attack) {
		this.attack = attack;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
