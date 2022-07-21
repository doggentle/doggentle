package com.gentle.www.vo;

public class ImageVO {
	private int ino;
	private long volume;
	private String upname, savename, dir;


	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public long getVolume() {
		return volume;
	}
	public void setVolume(long volume) {
		this.volume = volume;
	}
	public String getUpname() {
		return upname;
	}
	public void setUpname(String upname) {
		this.upname = upname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}

	@Override
	public String toString() {
		return "ImageVO [ino=" + ino + ", volume=" + volume + ", upname=" + upname + ", savename=" + savename + ", dir="
				+ dir + "]";
	}
}