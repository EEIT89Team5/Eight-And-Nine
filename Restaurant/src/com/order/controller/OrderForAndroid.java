package com.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/androidorder")
public class OrderForAndroid extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String JSON=(String)req.getAttribute("JSON");
		System.out.println("QQQ");
		System.out.println(JSON);
		JSONObject json=new JSONObject(JSON);
		System.out.println(json);
		JSONObject orderJson=json.getJSONObject("orderVO");
		JSONArray orderListJson=json.getJSONArray("orderList");
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		out.print("^^");
		
		
	}

}
