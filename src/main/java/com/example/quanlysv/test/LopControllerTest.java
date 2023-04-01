package com.example.quanlysv.test;

import com.example.quanlysv.servlet.controller.lop.DisplayLopController;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.service.ILopService;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.util.List;

public class LopControllerTest {
    @Mock
    private ILopService lopMock;
    @InjectMocks
    private DisplayLopController controller;

    @BeforeClass
    public  void initMock(){
        MockitoAnnotations.initMocks(this);
    }
    @Test
    public void testFindLop(){
        List<LopDTO> actualLop=controller.findLop();
        actualLop.stream().forEach(x->{
            System.out.println(x.toString());
        });
    }
}
