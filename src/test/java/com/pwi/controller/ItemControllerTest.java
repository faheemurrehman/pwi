package com.pwi.controller;

import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.pwi.bean.ItemVO;
import com.pwi.service.ItemService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:testContext.xml"})
@WebAppConfiguration
public class ItemControllerTest {
	
	private MockMvc mockMvc;
	 
    @Autowired
    private WebApplicationContext wac;
    
    @Autowired
    public ItemService itemServiceMock;
 
    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }
    
    @Test
    public void getItemTest() throws Exception {
    	ItemVO item = new ItemVO();
    	item.setId(1);
    	item.setName("TV");
    	item.setSize("10 ml");
    	 
        when(itemServiceMock.getItem(1)).thenReturn(item);
        
        mockMvc.perform(get("/items/{id}", 1)).andExpect(status().isOk())
        .andExpect(content().contentType("application/json;charset=UTF-8"))
        .andExpect(jsonPath("$.id", is(1)))
        .andExpect(jsonPath("$.name", is("TV")))
        .andExpect(jsonPath("$.size", is("10 ml")));
        
        verify(itemServiceMock, times(1)).getItem(1);
    }

}
