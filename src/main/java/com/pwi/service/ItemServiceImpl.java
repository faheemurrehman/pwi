package com.pwi.service;

import com.pwi.bean.ItemVO;

public class ItemServiceImpl implements ItemService {

	public ItemVO getItem(Integer id) {
		// TODO Auto-generated method stub
		ItemVO item = new ItemVO();
		
		item.setId(1);
		item.setName("TV");
		item.setSize("10 ml");
		return item;
	}

}
