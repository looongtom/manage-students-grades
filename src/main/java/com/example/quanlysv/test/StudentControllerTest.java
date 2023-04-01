package com.example.quanlysv.test;


import com.example.quanlysv.servlet.controller.student.CreateOrEditStudentController;
import com.example.quanlysv.servlet.controller.student.DeleteStudentController;
import com.example.quanlysv.servlet.controller.student.DisplayStudentController;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.service.IStudentService;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.util.List;


public class StudentControllerTest {

    @Mock
    private IStudentService serviceMock;

    @InjectMocks
    private DisplayStudentController controller;

//    private CreateOrEditStudentController createOrEditStudentController;

//    private DeleteStudentController deleteStudentController;

    @BeforeClass
    public void initMocks() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testFindStudent() {
        // given
//        BaseRequest request = new BaseRequest();
//        request.setPageIndex(0);
//        request.setPageSize(7);
//        request.setSortField("tenSv");
//        request.setSortOrder("desc");

        // when // test lấy danh sách
//        List<StudentDTO> actualStudents = controller.findStudent();

//        actualStudents.stream().forEach(x ->{
//            System.out.println(x.toString());
//        });

        // test thêm mới và sửa
//        deleteStudentController.deleteStudentById();
    }
}


