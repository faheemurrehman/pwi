package com.pwi.service;

import org.springframework.stereotype.Service;
import com.pwi.bean.ItemVO;

@Service
public interface ItemService {

	public ItemVO getItem(Integer id);
}
