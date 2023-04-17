package com.example.quanlysv.servlet.controller.grade.api;

import com.example.quanlysv.servlet.dto.request.diem.GradeDTO;
import com.example.quanlysv.servlet.entity.GradeEntity;
import com.example.quanlysv.servlet.service.IGradeService;
import com.example.quanlysv.servlet.service.impl.GradeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.util.List;

import static com.example.quanlysv.servlet.util.ReadExcelExample.getDataFromExcel;

@WebServlet("/home/grade/create-or-edit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CreateOrEditGradeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public IGradeService service ;
    public CreateOrEditGradeController(){
        this.service=new GradeServiceImpl();
    }
    private String realPath;
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        HttpSession session = req.getSession();
        String cookieName = (String) session.getAttribute("cookie_name");
        String cookieValue = (String) session.getAttribute("cookie_value");
        System.out.println("cookieName: "+cookieName);
        System.out.println("cookieValue: "+cookieValue);
        resp.setHeader( cookieName,cookieValue );

        Part part = req.getPart("file");
        String idDiem = req.getParameter("idDiem");
        String idGv = req.getParameter("idGv");
        String idMh = req.getParameter("idMh");
        String idHk = req.getParameter("idHk");
//        System.out.println("idDiem: "+idDiem);
//        System.out.println("idGv: "+idGv);
//        System.out.println("idMh: "+idMh);
//        System.out.println("idHk: "+idHk);
//        for (Part part : req.getParts()) {
        String fileName = extractFileName(part);
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        realPath = this.getFolderUpload().getAbsolutePath() + File.separator + fileName;
        part.write(realPath);
//        }
        System.out.println(realPath);


        List<GradeEntity> gradeList= getDataFromExcel(realPath);

        for(GradeEntity grade : gradeList) {
            Instant currentTime = Instant.now();
            GradeDTO gradeDTO = new GradeDTO();
            gradeDTO.setIdDiem(idDiem);
            gradeDTO.setIdGv(idGv);
            gradeDTO.setIdMh(idMh);
            gradeDTO.setIdHk(idHk);
            gradeDTO.setIdSv(grade.getIdSv());

            gradeDTO.setDiemCc(grade.getDiemCc());
            gradeDTO.setDiemBt(grade.getDiemBt());
            gradeDTO.setDiemThi(grade.getDiemThi());
            gradeDTO.setDiemKt(grade.getDiemKt());
            gradeDTO.setNgayTao(currentTime);
            gradeDTO.setNgaySua(currentTime);
            service.createOrUpdateGrade(gradeDTO);
        }
        System.out.println("create success");
    }
}