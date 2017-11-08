package com.pwi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.pwi.bean.ItemVO;
import com.pwi.service.ItemService;

@Transactional
@RestController("ItemV1")
@RequestMapping(value = "/items", produces = "application/json;charset=UTF-8", headers = { "Accept=application/json;charset=UTF-8" })
public class ItemController {
	
	 @Autowired
	 public ItemService itemService;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ItemVO getItem(@PathVariable Integer id) {
		
		return itemService.getItem(1);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ItemVO updateItem(@PathVariable Integer id) {
		return new ItemVO();
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ItemVO saveItem(@RequestBody ItemVO item) {
		return new ItemVO();
	}

}
