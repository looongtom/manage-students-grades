package com.example.quanlysv;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class Test {
    public static void main(String[] args) throws IOException {
        HttpClient httpClient = HttpClientBuilder.create().build();
        String uri = "http://localhost:8080/api/admin/home/student";
        String idSv="";
        String tenSv="";
        String sortField="";
        String sortOrder="";
        int pageIndex=1;
        int pageSize=2;
        String requestBody ="{"+
                "\"idSv\":\""+idSv+"\","+
                "\"tenSv\":\""+tenSv+"\","+
                "\"baseRequest\":{"+
                "\"sortField\":\""+sortField+"\","+
                "\"sortOrder\":\""+sortOrder+"\","+
                "\"pageIndex\":"+pageIndex+","+
                "\"pageSize\":"+pageSize+","+
                "}"+
                "}";

        HttpPost httpPost = new HttpPost(uri);
        StringEntity entity = new StringEntity(requestBody);
        httpPost.setEntity(entity);



        String value="JSESSIONID=";
        httpPost.setHeader("Cookie","JSESSIONID=5C04E49087023CFAD399BCAEBFF203B6");

        // send the request and retrieve the response
        HttpResponse resp = httpClient.execute(httpPost);
        String responseBody = EntityUtils.toString(resp.getEntity());
        System.out.println(responseBody);

        JSONObject jsonResponse = new JSONObject(responseBody);
        JSONArray listResp = jsonResponse.getJSONArray("data");
        System.out.println(listResp.length());
        for(int i=0;i<listResp.length();i++){
            JSONObject teacher = listResp.getJSONObject(i);
            System.out.println(teacher.toString());
        }
    }
}
