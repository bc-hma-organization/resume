package com.hma.resume.util;
/**
 * 分页用
 * @author 区块链培训学院
 * indexNum 目录数量
 * MAXNUM 页最大数量
 */
public class Page {

	public static int page(Integer indexNum,Integer MAX_NUM) {
		int pageNum = 0;
		if (indexNum <= 0){
			pageNum = 1;
		}else {
			if (indexNum < MAX_NUM) {
				pageNum = 1;
			} else {
				if (indexNum % MAX_NUM == 0) {
					pageNum = indexNum / MAX_NUM;
				} else {
					pageNum = (indexNum / MAX_NUM) + 1;
				}
			}
		}
		return pageNum;
	}
}
