package com.zs.pms.vo;

public class QueryPage {
protected int start;
protected int end;
protected int page;//当前页
public int getStart() {
	//计算开始的位置 当前页减1乘每页的条数再加一
	return (page-1)*Constants.PAGECOUNT+1;
}
public void setStart(int start) {
	this.start = start;
}
public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}
public int getEnd() {
	return page*Constants.PAGECOUNT;
}
public void setEnd(int end) {
	this.end = end;
}
}
