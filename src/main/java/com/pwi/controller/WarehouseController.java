package com.pwi.controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.pwi.bean.ItemVO;
import com.pwi.bean.WarehouseVO;

@Transactional
@RestController("WarehouseV1")
@RequestMapping(value = "/warehouses", produces = "application/json;charset=UTF-8", headers = { "Accept=application/json;charset=UTF-8" })
public class WarehouseController {

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public WarehouseVO getWarehouse(@PathVariable Integer id) {
		return new WarehouseVO();
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public WarehouseVO updateWarehouse(@PathVariable Integer id) {
		return new WarehouseVO();
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public WarehouseVO saveWarehouse(@RequestBody ItemVO item) {
		return new WarehouseVO();
	}
}
