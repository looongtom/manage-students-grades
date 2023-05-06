import com.example.quanlysv.servlet.entity.TeacherEntityResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

public class Test {
    public static void main(String[] args) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
//        String jsonCarArray ="[{"+
//                "\"idGv\":\"GV005\","+
//                "\"tenGv\":\"ĐậuHuy\","+
//                "\"sdtGv\":\"123456789\","+
//                "\"emailGv\":\"huy@gmail.com\","+
//                "\"genderGv\":\"Nam\","+
//                "\"idKhoa\":\"CNTT\","+
//                "\"tenKhoa\":\"CongNgheThongTin\","+
//                "\"ngayTao\":\"03/05/202317:08:47\","+
//                "\"ngaySua\":\"03/05/202317:19:31\""+
//                "}]";
        String jsonCarArray =
                "["+
                        "{"+
                        "\"idGv\":\"GV005\","+
                        "\"tenGv\":\"ĐậuHuy\","+
                        "\"sdtGv\":\"123456789\","+
                        "\"emailGv\":\"huy@gmail.com\","+
                        "\"genderGv\":\"Nam\","+
                        "\"idKhoa\":\"CNTT\","+
                        "\"tenKhoa\":\"Côngnghệthôngtin\","+
                        "\"ngayTao\":\"03/05/202317:08:47\","+
                        "\"ngaySua\":\"03/05/202317:19:31\""+
                        "},"+
                        "{"+
                        "\"idGv\":\"GV006\","+
                        "\"tenGv\":\"ĐậuHoe\","+
                        "\"sdtGv\":\"963852741\","+
                        "\"emailGv\":\"huy@gmail.com\","+
                        "\"genderGv\":\"Nam\","+
                        "\"idKhoa\":\"ATTT\","+
                        "\"tenKhoa\":\"Antoànthôngtin\","+
                        "\"ngayTao\":\"03/05/202317:23:28\","+
                        "\"ngaySua\":\"03/05/202317:24:04\""+
                        "}"+
                        "]";
        List<TeacherEntityResponse> list = objectMapper.readValue(jsonCarArray, new TypeReference<List<TeacherEntityResponse>>(){});
        for ( TeacherEntityResponse tmp: list){
            System.out.println(tmp.toString());
        }
        System.out.println(list.size());
    }
}
