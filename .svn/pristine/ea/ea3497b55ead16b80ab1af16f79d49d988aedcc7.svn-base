package com.gym.app.util;

public class PageUtil {
	private int pageNum;//������������ȣ
	private int startRow;//�������ȣ
	private int endRow;//�����ȣ
	private int pageCount;//����������
	private int startPage;//����������
	private int endPage;//��������
	private int rowCount;//��ü���ǰ���
	
	public PageUtil(){}
	/**
	 * 
	 * @param pageNum ��������ȣ
	 * @param rowCount ��ü���ǰ���
	 * @param rowBlockCount ���������� ������ ���� ����
	 * @param pageBlockCount ���������� ������ �������� ����
	 */
	public PageUtil(int pageNum, int rowCount,int rowBlockCount,int pageBlockCount) {
		this.pageNum = pageNum;
		this.rowCount = rowCount;
		startRow=(pageNum-1)*rowBlockCount+1;
		endRow=startRow+(rowBlockCount-1);
		pageCount=(int)Math.ceil(rowCount/(double)rowBlockCount);
		startPage=(pageNum-1)/pageBlockCount*pageBlockCount+1;
		endPage=startPage+pageBlockCount-1;
		if(endPage>pageCount){
			endPage=pageCount;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	
}
